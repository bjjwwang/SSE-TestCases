; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_memcpy_09-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_memcpy_09-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@GLOBAL_CONST_TRUE = external constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external constant i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_09_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 49), !dbg !35
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !38
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 65, i64 noundef 99), !dbg !39
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !40
  store i32 0, i32* %arrayidx3, align 4, !dbg !41
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !42
  %tobool = icmp ne i32 %0, 0, !dbg !42
  br i1 %tobool, label %if.then, label %if.end, !dbg !44

if.then:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !45
  store i32* %arraydecay4, i32** %data, align 8, !dbg !47
  br label %if.end, !dbg !48

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !49, metadata !DIExpression()), !dbg !51
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !52
  %call6 = call i32* @wmemset(i32* noundef %arraydecay5, i32 noundef 67, i64 noundef 99), !dbg !53
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !54
  store i32 0, i32* %arrayidx7, align 4, !dbg !55
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !56
  %1 = bitcast i32* %arraydecay8 to i8*, !dbg !56
  %2 = load i32*, i32** %data, align 8, !dbg !56
  %3 = bitcast i32* %2 to i8*, !dbg !56
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !56
  %call10 = call i64 @wcslen(i32* noundef %arraydecay9), !dbg !56
  %mul = mul i64 %call10, 4, !dbg !56
  %call11 = call i8* @__memcpy_chk(i8* noundef %1, i8* noundef %3, i64 noundef %mul, i64 noundef 400) #4, !dbg !56
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !57
  store i32 0, i32* %arrayidx12, align 4, !dbg !58
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !59
  call void @printWLine(i32* noundef %arraydecay13), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_09_good() #0 !dbg !62 {
entry:
  call void @goodG2B1(), !dbg !63
  call void @goodG2B2(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !66 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i64 @time(i64* noundef null), !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 noundef %conv), !dbg !78
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_09_good(), !dbg !80
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_09_bad(), !dbg !83
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !86 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !93
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 49), !dbg !94
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !95
  store i32 0, i32* %arrayidx, align 4, !dbg !96
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !97
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 65, i64 noundef 99), !dbg !98
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !99
  store i32 0, i32* %arrayidx3, align 4, !dbg !100
  %0 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !101
  %tobool = icmp ne i32 %0, 0, !dbg !101
  br i1 %tobool, label %if.then, label %if.else, !dbg !103

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !104
  br label %if.end, !dbg !106

if.else:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !107
  store i32* %arraydecay4, i32** %data, align 8, !dbg !109
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !110, metadata !DIExpression()), !dbg !112
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !113
  %call6 = call i32* @wmemset(i32* noundef %arraydecay5, i32 noundef 67, i64 noundef 99), !dbg !114
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !115
  store i32 0, i32* %arrayidx7, align 4, !dbg !116
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !117
  %1 = bitcast i32* %arraydecay8 to i8*, !dbg !117
  %2 = load i32*, i32** %data, align 8, !dbg !117
  %3 = bitcast i32* %2 to i8*, !dbg !117
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !117
  %call10 = call i64 @wcslen(i32* noundef %arraydecay9), !dbg !117
  %mul = mul i64 %call10, 4, !dbg !117
  %call11 = call i8* @__memcpy_chk(i8* noundef %1, i8* noundef %3, i64 noundef %mul, i64 noundef 400) #4, !dbg !117
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !118
  store i32 0, i32* %arrayidx12, align 4, !dbg !119
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !120
  call void @printWLine(i32* noundef %arraydecay13), !dbg !121
  ret void, !dbg !122
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !123 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !126, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !128, metadata !DIExpression()), !dbg !129
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !130
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 49), !dbg !131
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !132
  store i32 0, i32* %arrayidx, align 4, !dbg !133
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !134
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 65, i64 noundef 99), !dbg !135
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !136
  store i32 0, i32* %arrayidx3, align 4, !dbg !137
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !138
  %tobool = icmp ne i32 %0, 0, !dbg !138
  br i1 %tobool, label %if.then, label %if.end, !dbg !140

if.then:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !141
  store i32* %arraydecay4, i32** %data, align 8, !dbg !143
  br label %if.end, !dbg !144

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !145, metadata !DIExpression()), !dbg !147
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !148
  %call6 = call i32* @wmemset(i32* noundef %arraydecay5, i32 noundef 67, i64 noundef 99), !dbg !149
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !150
  store i32 0, i32* %arrayidx7, align 4, !dbg !151
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !152
  %1 = bitcast i32* %arraydecay8 to i8*, !dbg !152
  %2 = load i32*, i32** %data, align 8, !dbg !152
  %3 = bitcast i32* %2 to i8*, !dbg !152
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !152
  %call10 = call i64 @wcslen(i32* noundef %arraydecay9), !dbg !152
  %mul = mul i64 %call10, 4, !dbg !152
  %call11 = call i8* @__memcpy_chk(i8* noundef %1, i8* noundef %3, i64 noundef %mul, i64 noundef 400) #4, !dbg !152
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !153
  store i32 0, i32* %arrayidx12, align 4, !dbg !154
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !155
  call void @printWLine(i32* noundef %arraydecay13), !dbg !156
  ret void, !dbg !157
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_memcpy_09-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memcpy_09_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_memcpy_09-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 34, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !21, line: 106, baseType: !22)
!21 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DILocation(line: 25, column: 15, scope: !11)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1600, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 26, column: 13, scope: !11)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 27, column: 13, scope: !11)
!34 = !DILocation(line: 28, column: 13, scope: !11)
!35 = !DILocation(line: 28, column: 5, scope: !11)
!36 = !DILocation(line: 29, column: 5, scope: !11)
!37 = !DILocation(line: 29, column: 25, scope: !11)
!38 = !DILocation(line: 30, column: 13, scope: !11)
!39 = !DILocation(line: 30, column: 5, scope: !11)
!40 = !DILocation(line: 31, column: 5, scope: !11)
!41 = !DILocation(line: 31, column: 27, scope: !11)
!42 = !DILocation(line: 32, column: 8, scope: !43)
!43 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 8)
!44 = !DILocation(line: 32, column: 8, scope: !11)
!45 = !DILocation(line: 35, column: 16, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !12, line: 33, column: 5)
!47 = !DILocation(line: 35, column: 14, scope: !46)
!48 = !DILocation(line: 36, column: 5, scope: !46)
!49 = !DILocalVariable(name: "dest", scope: !50, file: !12, line: 38, type: !30)
!50 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!51 = !DILocation(line: 38, column: 17, scope: !50)
!52 = !DILocation(line: 39, column: 17, scope: !50)
!53 = !DILocation(line: 39, column: 9, scope: !50)
!54 = !DILocation(line: 40, column: 9, scope: !50)
!55 = !DILocation(line: 40, column: 21, scope: !50)
!56 = !DILocation(line: 43, column: 9, scope: !50)
!57 = !DILocation(line: 44, column: 9, scope: !50)
!58 = !DILocation(line: 44, column: 21, scope: !50)
!59 = !DILocation(line: 45, column: 20, scope: !50)
!60 = !DILocation(line: 45, column: 9, scope: !50)
!61 = !DILocation(line: 47, column: 1, scope: !11)
!62 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memcpy_09_good", scope: !12, file: !12, line: 112, type: !13, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!63 = !DILocation(line: 114, column: 5, scope: !62)
!64 = !DILocation(line: 115, column: 5, scope: !62)
!65 = !DILocation(line: 116, column: 1, scope: !62)
!66 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 128, type: !67, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!67 = !DISubroutineType(types: !68)
!68 = !{!22, !22, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !12, line: 128, type: !22)
!73 = !DILocation(line: 128, column: 14, scope: !66)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !12, line: 128, type: !69)
!75 = !DILocation(line: 128, column: 27, scope: !66)
!76 = !DILocation(line: 131, column: 22, scope: !66)
!77 = !DILocation(line: 131, column: 12, scope: !66)
!78 = !DILocation(line: 131, column: 5, scope: !66)
!79 = !DILocation(line: 133, column: 5, scope: !66)
!80 = !DILocation(line: 134, column: 5, scope: !66)
!81 = !DILocation(line: 135, column: 5, scope: !66)
!82 = !DILocation(line: 138, column: 5, scope: !66)
!83 = !DILocation(line: 139, column: 5, scope: !66)
!84 = !DILocation(line: 140, column: 5, scope: !66)
!85 = !DILocation(line: 142, column: 5, scope: !66)
!86 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!87 = !DILocalVariable(name: "data", scope: !86, file: !12, line: 56, type: !17)
!88 = !DILocation(line: 56, column: 15, scope: !86)
!89 = !DILocalVariable(name: "dataBadBuffer", scope: !86, file: !12, line: 57, type: !25)
!90 = !DILocation(line: 57, column: 13, scope: !86)
!91 = !DILocalVariable(name: "dataGoodBuffer", scope: !86, file: !12, line: 58, type: !30)
!92 = !DILocation(line: 58, column: 13, scope: !86)
!93 = !DILocation(line: 59, column: 13, scope: !86)
!94 = !DILocation(line: 59, column: 5, scope: !86)
!95 = !DILocation(line: 60, column: 5, scope: !86)
!96 = !DILocation(line: 60, column: 25, scope: !86)
!97 = !DILocation(line: 61, column: 13, scope: !86)
!98 = !DILocation(line: 61, column: 5, scope: !86)
!99 = !DILocation(line: 62, column: 5, scope: !86)
!100 = !DILocation(line: 62, column: 27, scope: !86)
!101 = !DILocation(line: 63, column: 8, scope: !102)
!102 = distinct !DILexicalBlock(scope: !86, file: !12, line: 63, column: 8)
!103 = !DILocation(line: 63, column: 8, scope: !86)
!104 = !DILocation(line: 66, column: 9, scope: !105)
!105 = distinct !DILexicalBlock(scope: !102, file: !12, line: 64, column: 5)
!106 = !DILocation(line: 67, column: 5, scope: !105)
!107 = !DILocation(line: 71, column: 16, scope: !108)
!108 = distinct !DILexicalBlock(scope: !102, file: !12, line: 69, column: 5)
!109 = !DILocation(line: 71, column: 14, scope: !108)
!110 = !DILocalVariable(name: "dest", scope: !111, file: !12, line: 74, type: !30)
!111 = distinct !DILexicalBlock(scope: !86, file: !12, line: 73, column: 5)
!112 = !DILocation(line: 74, column: 17, scope: !111)
!113 = !DILocation(line: 75, column: 17, scope: !111)
!114 = !DILocation(line: 75, column: 9, scope: !111)
!115 = !DILocation(line: 76, column: 9, scope: !111)
!116 = !DILocation(line: 76, column: 21, scope: !111)
!117 = !DILocation(line: 79, column: 9, scope: !111)
!118 = !DILocation(line: 80, column: 9, scope: !111)
!119 = !DILocation(line: 80, column: 21, scope: !111)
!120 = !DILocation(line: 81, column: 20, scope: !111)
!121 = !DILocation(line: 81, column: 9, scope: !111)
!122 = !DILocation(line: 83, column: 1, scope: !86)
!123 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 86, type: !13, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!124 = !DILocalVariable(name: "data", scope: !123, file: !12, line: 88, type: !17)
!125 = !DILocation(line: 88, column: 15, scope: !123)
!126 = !DILocalVariable(name: "dataBadBuffer", scope: !123, file: !12, line: 89, type: !25)
!127 = !DILocation(line: 89, column: 13, scope: !123)
!128 = !DILocalVariable(name: "dataGoodBuffer", scope: !123, file: !12, line: 90, type: !30)
!129 = !DILocation(line: 90, column: 13, scope: !123)
!130 = !DILocation(line: 91, column: 13, scope: !123)
!131 = !DILocation(line: 91, column: 5, scope: !123)
!132 = !DILocation(line: 92, column: 5, scope: !123)
!133 = !DILocation(line: 92, column: 25, scope: !123)
!134 = !DILocation(line: 93, column: 13, scope: !123)
!135 = !DILocation(line: 93, column: 5, scope: !123)
!136 = !DILocation(line: 94, column: 5, scope: !123)
!137 = !DILocation(line: 94, column: 27, scope: !123)
!138 = !DILocation(line: 95, column: 8, scope: !139)
!139 = distinct !DILexicalBlock(scope: !123, file: !12, line: 95, column: 8)
!140 = !DILocation(line: 95, column: 8, scope: !123)
!141 = !DILocation(line: 98, column: 16, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !12, line: 96, column: 5)
!143 = !DILocation(line: 98, column: 14, scope: !142)
!144 = !DILocation(line: 99, column: 5, scope: !142)
!145 = !DILocalVariable(name: "dest", scope: !146, file: !12, line: 101, type: !30)
!146 = distinct !DILexicalBlock(scope: !123, file: !12, line: 100, column: 5)
!147 = !DILocation(line: 101, column: 17, scope: !146)
!148 = !DILocation(line: 102, column: 17, scope: !146)
!149 = !DILocation(line: 102, column: 9, scope: !146)
!150 = !DILocation(line: 103, column: 9, scope: !146)
!151 = !DILocation(line: 103, column: 21, scope: !146)
!152 = !DILocation(line: 106, column: 9, scope: !146)
!153 = !DILocation(line: 107, column: 9, scope: !146)
!154 = !DILocation(line: 107, column: 21, scope: !146)
!155 = !DILocation(line: 108, column: 20, scope: !146)
!156 = !DILocation(line: 108, column: 9, scope: !146)
!157 = !DILocation(line: 110, column: 1, scope: !123)
