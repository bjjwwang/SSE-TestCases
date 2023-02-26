; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_memcpy_08-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_memcpy_08-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_08_bad() #0 !dbg !11 {
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
  %call4 = call i32 @staticReturnsTrue(), !dbg !42
  %tobool = icmp ne i32 %call4, 0, !dbg !42
  br i1 %tobool, label %if.then, label %if.end, !dbg !44

if.then:                                          ; preds = %entry
  %arraydecay5 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !45
  store i32* %arraydecay5, i32** %data, align 8, !dbg !47
  br label %if.end, !dbg !48

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !49, metadata !DIExpression()), !dbg !51
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !52
  %call7 = call i32* @wmemset(i32* noundef %arraydecay6, i32 noundef 67, i64 noundef 99), !dbg !53
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !54
  store i32 0, i32* %arrayidx8, align 4, !dbg !55
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !56
  %0 = bitcast i32* %arraydecay9 to i8*, !dbg !56
  %1 = load i32*, i32** %data, align 8, !dbg !56
  %2 = bitcast i32* %1 to i8*, !dbg !56
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !56
  %call11 = call i64 @wcslen(i32* noundef %arraydecay10), !dbg !56
  %mul = mul i64 %call11, 4, !dbg !56
  %call12 = call i8* @__memcpy_chk(i8* noundef %0, i8* noundef %2, i64 noundef %mul, i64 noundef 400) #4, !dbg !56
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !57
  store i32 0, i32* %arrayidx13, align 4, !dbg !58
  %arraydecay14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !59
  call void @printWLine(i32* noundef %arraydecay14), !dbg !60
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
define void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_08_good() #0 !dbg !62 {
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
  call void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_08_good(), !dbg !80
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_08_bad(), !dbg !83
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !86 {
entry:
  ret i32 1, !dbg !89
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !90 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !97
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 49), !dbg !98
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !99
  store i32 0, i32* %arrayidx, align 4, !dbg !100
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !101
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 65, i64 noundef 99), !dbg !102
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !103
  store i32 0, i32* %arrayidx3, align 4, !dbg !104
  %call4 = call i32 @staticReturnsFalse(), !dbg !105
  %tobool = icmp ne i32 %call4, 0, !dbg !105
  br i1 %tobool, label %if.then, label %if.else, !dbg !107

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !108
  br label %if.end, !dbg !110

if.else:                                          ; preds = %entry
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !111
  store i32* %arraydecay5, i32** %data, align 8, !dbg !113
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !114, metadata !DIExpression()), !dbg !116
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !117
  %call7 = call i32* @wmemset(i32* noundef %arraydecay6, i32 noundef 67, i64 noundef 99), !dbg !118
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !119
  store i32 0, i32* %arrayidx8, align 4, !dbg !120
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !121
  %0 = bitcast i32* %arraydecay9 to i8*, !dbg !121
  %1 = load i32*, i32** %data, align 8, !dbg !121
  %2 = bitcast i32* %1 to i8*, !dbg !121
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !121
  %call11 = call i64 @wcslen(i32* noundef %arraydecay10), !dbg !121
  %mul = mul i64 %call11, 4, !dbg !121
  %call12 = call i8* @__memcpy_chk(i8* noundef %0, i8* noundef %2, i64 noundef %mul, i64 noundef 400) #4, !dbg !121
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !122
  store i32 0, i32* %arrayidx13, align 4, !dbg !123
  %arraydecay14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !124
  call void @printWLine(i32* noundef %arraydecay14), !dbg !125
  ret void, !dbg !126
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !127 {
entry:
  ret i32 0, !dbg !128
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !129 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !130, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !132, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !134, metadata !DIExpression()), !dbg !135
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !136
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 49), !dbg !137
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !138
  store i32 0, i32* %arrayidx, align 4, !dbg !139
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !140
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 65, i64 noundef 99), !dbg !141
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !142
  store i32 0, i32* %arrayidx3, align 4, !dbg !143
  %call4 = call i32 @staticReturnsTrue(), !dbg !144
  %tobool = icmp ne i32 %call4, 0, !dbg !144
  br i1 %tobool, label %if.then, label %if.end, !dbg !146

if.then:                                          ; preds = %entry
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !147
  store i32* %arraydecay5, i32** %data, align 8, !dbg !149
  br label %if.end, !dbg !150

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !151, metadata !DIExpression()), !dbg !153
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !154
  %call7 = call i32* @wmemset(i32* noundef %arraydecay6, i32 noundef 67, i64 noundef 99), !dbg !155
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !156
  store i32 0, i32* %arrayidx8, align 4, !dbg !157
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !158
  %0 = bitcast i32* %arraydecay9 to i8*, !dbg !158
  %1 = load i32*, i32** %data, align 8, !dbg !158
  %2 = bitcast i32* %1 to i8*, !dbg !158
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !158
  %call11 = call i64 @wcslen(i32* noundef %arraydecay10), !dbg !158
  %mul = mul i64 %call11, 4, !dbg !158
  %call12 = call i8* @__memcpy_chk(i8* noundef %0, i8* noundef %2, i64 noundef %mul, i64 noundef 400) #4, !dbg !158
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !159
  store i32 0, i32* %arrayidx13, align 4, !dbg !160
  %arraydecay14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !161
  call void @printWLine(i32* noundef %arraydecay14), !dbg !162
  ret void, !dbg !163
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_memcpy_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memcpy_08_bad", scope: !12, file: !12, line: 37, type: !13, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_memcpy_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 39, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 34, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !21, line: 106, baseType: !22)
!21 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DILocation(line: 39, column: 15, scope: !11)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 40, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1600, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 40, column: 13, scope: !11)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 41, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 41, column: 13, scope: !11)
!34 = !DILocation(line: 42, column: 13, scope: !11)
!35 = !DILocation(line: 42, column: 5, scope: !11)
!36 = !DILocation(line: 43, column: 5, scope: !11)
!37 = !DILocation(line: 43, column: 25, scope: !11)
!38 = !DILocation(line: 44, column: 13, scope: !11)
!39 = !DILocation(line: 44, column: 5, scope: !11)
!40 = !DILocation(line: 45, column: 5, scope: !11)
!41 = !DILocation(line: 45, column: 27, scope: !11)
!42 = !DILocation(line: 46, column: 8, scope: !43)
!43 = distinct !DILexicalBlock(scope: !11, file: !12, line: 46, column: 8)
!44 = !DILocation(line: 46, column: 8, scope: !11)
!45 = !DILocation(line: 49, column: 16, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !12, line: 47, column: 5)
!47 = !DILocation(line: 49, column: 14, scope: !46)
!48 = !DILocation(line: 50, column: 5, scope: !46)
!49 = !DILocalVariable(name: "dest", scope: !50, file: !12, line: 52, type: !30)
!50 = distinct !DILexicalBlock(scope: !11, file: !12, line: 51, column: 5)
!51 = !DILocation(line: 52, column: 17, scope: !50)
!52 = !DILocation(line: 53, column: 17, scope: !50)
!53 = !DILocation(line: 53, column: 9, scope: !50)
!54 = !DILocation(line: 54, column: 9, scope: !50)
!55 = !DILocation(line: 54, column: 21, scope: !50)
!56 = !DILocation(line: 57, column: 9, scope: !50)
!57 = !DILocation(line: 58, column: 9, scope: !50)
!58 = !DILocation(line: 58, column: 21, scope: !50)
!59 = !DILocation(line: 59, column: 20, scope: !50)
!60 = !DILocation(line: 59, column: 9, scope: !50)
!61 = !DILocation(line: 61, column: 1, scope: !11)
!62 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memcpy_08_good", scope: !12, file: !12, line: 126, type: !13, scopeLine: 127, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!63 = !DILocation(line: 128, column: 5, scope: !62)
!64 = !DILocation(line: 129, column: 5, scope: !62)
!65 = !DILocation(line: 130, column: 1, scope: !62)
!66 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 142, type: !67, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!67 = !DISubroutineType(types: !68)
!68 = !{!22, !22, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !12, line: 142, type: !22)
!73 = !DILocation(line: 142, column: 14, scope: !66)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !12, line: 142, type: !69)
!75 = !DILocation(line: 142, column: 27, scope: !66)
!76 = !DILocation(line: 145, column: 22, scope: !66)
!77 = !DILocation(line: 145, column: 12, scope: !66)
!78 = !DILocation(line: 145, column: 5, scope: !66)
!79 = !DILocation(line: 147, column: 5, scope: !66)
!80 = !DILocation(line: 148, column: 5, scope: !66)
!81 = !DILocation(line: 149, column: 5, scope: !66)
!82 = !DILocation(line: 152, column: 5, scope: !66)
!83 = !DILocation(line: 153, column: 5, scope: !66)
!84 = !DILocation(line: 154, column: 5, scope: !66)
!85 = !DILocation(line: 156, column: 5, scope: !66)
!86 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 25, type: !87, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!87 = !DISubroutineType(types: !88)
!88 = !{!22}
!89 = !DILocation(line: 27, column: 5, scope: !86)
!90 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 68, type: !13, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!91 = !DILocalVariable(name: "data", scope: !90, file: !12, line: 70, type: !17)
!92 = !DILocation(line: 70, column: 15, scope: !90)
!93 = !DILocalVariable(name: "dataBadBuffer", scope: !90, file: !12, line: 71, type: !25)
!94 = !DILocation(line: 71, column: 13, scope: !90)
!95 = !DILocalVariable(name: "dataGoodBuffer", scope: !90, file: !12, line: 72, type: !30)
!96 = !DILocation(line: 72, column: 13, scope: !90)
!97 = !DILocation(line: 73, column: 13, scope: !90)
!98 = !DILocation(line: 73, column: 5, scope: !90)
!99 = !DILocation(line: 74, column: 5, scope: !90)
!100 = !DILocation(line: 74, column: 25, scope: !90)
!101 = !DILocation(line: 75, column: 13, scope: !90)
!102 = !DILocation(line: 75, column: 5, scope: !90)
!103 = !DILocation(line: 76, column: 5, scope: !90)
!104 = !DILocation(line: 76, column: 27, scope: !90)
!105 = !DILocation(line: 77, column: 8, scope: !106)
!106 = distinct !DILexicalBlock(scope: !90, file: !12, line: 77, column: 8)
!107 = !DILocation(line: 77, column: 8, scope: !90)
!108 = !DILocation(line: 80, column: 9, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !12, line: 78, column: 5)
!110 = !DILocation(line: 81, column: 5, scope: !109)
!111 = !DILocation(line: 85, column: 16, scope: !112)
!112 = distinct !DILexicalBlock(scope: !106, file: !12, line: 83, column: 5)
!113 = !DILocation(line: 85, column: 14, scope: !112)
!114 = !DILocalVariable(name: "dest", scope: !115, file: !12, line: 88, type: !30)
!115 = distinct !DILexicalBlock(scope: !90, file: !12, line: 87, column: 5)
!116 = !DILocation(line: 88, column: 17, scope: !115)
!117 = !DILocation(line: 89, column: 17, scope: !115)
!118 = !DILocation(line: 89, column: 9, scope: !115)
!119 = !DILocation(line: 90, column: 9, scope: !115)
!120 = !DILocation(line: 90, column: 21, scope: !115)
!121 = !DILocation(line: 93, column: 9, scope: !115)
!122 = !DILocation(line: 94, column: 9, scope: !115)
!123 = !DILocation(line: 94, column: 21, scope: !115)
!124 = !DILocation(line: 95, column: 20, scope: !115)
!125 = !DILocation(line: 95, column: 9, scope: !115)
!126 = !DILocation(line: 97, column: 1, scope: !90)
!127 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 30, type: !87, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!128 = !DILocation(line: 32, column: 5, scope: !127)
!129 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 100, type: !13, scopeLine: 101, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!130 = !DILocalVariable(name: "data", scope: !129, file: !12, line: 102, type: !17)
!131 = !DILocation(line: 102, column: 15, scope: !129)
!132 = !DILocalVariable(name: "dataBadBuffer", scope: !129, file: !12, line: 103, type: !25)
!133 = !DILocation(line: 103, column: 13, scope: !129)
!134 = !DILocalVariable(name: "dataGoodBuffer", scope: !129, file: !12, line: 104, type: !30)
!135 = !DILocation(line: 104, column: 13, scope: !129)
!136 = !DILocation(line: 105, column: 13, scope: !129)
!137 = !DILocation(line: 105, column: 5, scope: !129)
!138 = !DILocation(line: 106, column: 5, scope: !129)
!139 = !DILocation(line: 106, column: 25, scope: !129)
!140 = !DILocation(line: 107, column: 13, scope: !129)
!141 = !DILocation(line: 107, column: 5, scope: !129)
!142 = !DILocation(line: 108, column: 5, scope: !129)
!143 = !DILocation(line: 108, column: 27, scope: !129)
!144 = !DILocation(line: 109, column: 8, scope: !145)
!145 = distinct !DILexicalBlock(scope: !129, file: !12, line: 109, column: 8)
!146 = !DILocation(line: 109, column: 8, scope: !129)
!147 = !DILocation(line: 112, column: 16, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !12, line: 110, column: 5)
!149 = !DILocation(line: 112, column: 14, scope: !148)
!150 = !DILocation(line: 113, column: 5, scope: !148)
!151 = !DILocalVariable(name: "dest", scope: !152, file: !12, line: 115, type: !30)
!152 = distinct !DILexicalBlock(scope: !129, file: !12, line: 114, column: 5)
!153 = !DILocation(line: 115, column: 17, scope: !152)
!154 = !DILocation(line: 116, column: 17, scope: !152)
!155 = !DILocation(line: 116, column: 9, scope: !152)
!156 = !DILocation(line: 117, column: 9, scope: !152)
!157 = !DILocation(line: 117, column: 21, scope: !152)
!158 = !DILocation(line: 120, column: 9, scope: !152)
!159 = !DILocation(line: 121, column: 9, scope: !152)
!160 = !DILocation(line: 121, column: 21, scope: !152)
!161 = !DILocation(line: 122, column: 20, scope: !152)
!162 = !DILocation(line: 122, column: 9, scope: !152)
!163 = !DILocation(line: 124, column: 1, scope: !129)
