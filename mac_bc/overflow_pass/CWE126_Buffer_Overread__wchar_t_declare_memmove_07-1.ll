; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_memmove_07-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_memmove_07-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_declare_memmove_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !32, metadata !DIExpression()), !dbg !36
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !37
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 49), !dbg !38
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !39
  store i32 0, i32* %arrayidx, align 4, !dbg !40
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !41
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 65, i64 noundef 99), !dbg !42
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !43
  store i32 0, i32* %arrayidx3, align 4, !dbg !44
  %0 = load i32, i32* @staticFive, align 4, !dbg !45
  %cmp = icmp eq i32 %0, 5, !dbg !47
  br i1 %cmp, label %if.then, label %if.end, !dbg !48

if.then:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !49
  store i32* %arraydecay4, i32** %data, align 8, !dbg !51
  br label %if.end, !dbg !52

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !53, metadata !DIExpression()), !dbg !55
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !56
  %call6 = call i32* @wmemset(i32* noundef %arraydecay5, i32 noundef 67, i64 noundef 99), !dbg !57
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !58
  store i32 0, i32* %arrayidx7, align 4, !dbg !59
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !60
  %1 = bitcast i32* %arraydecay8 to i8*, !dbg !60
  %2 = load i32*, i32** %data, align 8, !dbg !60
  %3 = bitcast i32* %2 to i8*, !dbg !60
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !60
  %call10 = call i64 @wcslen(i32* noundef %arraydecay9), !dbg !60
  %mul = mul i64 %call10, 4, !dbg !60
  %call11 = call i8* @__memmove_chk(i8* noundef %1, i8* noundef %3, i64 noundef %mul, i64 noundef 400) #4, !dbg !60
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !61
  store i32 0, i32* %arrayidx12, align 4, !dbg !62
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !63
  call void @printWLine(i32* noundef %arraydecay13), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_declare_memmove_07_good() #0 !dbg !66 {
entry:
  call void @goodG2B1(), !dbg !67
  call void @goodG2B2(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !70 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call i64 @time(i64* noundef null), !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 noundef %conv), !dbg !82
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @CWE126_Buffer_Overread__wchar_t_declare_memmove_07_good(), !dbg !84
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @CWE126_Buffer_Overread__wchar_t_declare_memmove_07_bad(), !dbg !87
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

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
  %0 = load i32, i32* @staticFive, align 4, !dbg !105
  %cmp = icmp ne i32 %0, 5, !dbg !107
  br i1 %cmp, label %if.then, label %if.else, !dbg !108

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !109
  br label %if.end, !dbg !111

if.else:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !112
  store i32* %arraydecay4, i32** %data, align 8, !dbg !114
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !115, metadata !DIExpression()), !dbg !117
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !118
  %call6 = call i32* @wmemset(i32* noundef %arraydecay5, i32 noundef 67, i64 noundef 99), !dbg !119
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !120
  store i32 0, i32* %arrayidx7, align 4, !dbg !121
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !122
  %1 = bitcast i32* %arraydecay8 to i8*, !dbg !122
  %2 = load i32*, i32** %data, align 8, !dbg !122
  %3 = bitcast i32* %2 to i8*, !dbg !122
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !122
  %call10 = call i64 @wcslen(i32* noundef %arraydecay9), !dbg !122
  %mul = mul i64 %call10, 4, !dbg !122
  %call11 = call i8* @__memmove_chk(i8* noundef %1, i8* noundef %3, i64 noundef %mul, i64 noundef 400) #4, !dbg !122
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !123
  store i32 0, i32* %arrayidx12, align 4, !dbg !124
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !125
  call void @printWLine(i32* noundef %arraydecay13), !dbg !126
  ret void, !dbg !127
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !128 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !129, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !131, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !133, metadata !DIExpression()), !dbg !134
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !135
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 49), !dbg !136
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !137
  store i32 0, i32* %arrayidx, align 4, !dbg !138
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !139
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 65, i64 noundef 99), !dbg !140
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !141
  store i32 0, i32* %arrayidx3, align 4, !dbg !142
  %0 = load i32, i32* @staticFive, align 4, !dbg !143
  %cmp = icmp eq i32 %0, 5, !dbg !145
  br i1 %cmp, label %if.then, label %if.end, !dbg !146

if.then:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !147
  store i32* %arraydecay4, i32** %data, align 8, !dbg !149
  br label %if.end, !dbg !150

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !151, metadata !DIExpression()), !dbg !153
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !154
  %call6 = call i32* @wmemset(i32* noundef %arraydecay5, i32 noundef 67, i64 noundef 99), !dbg !155
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !156
  store i32 0, i32* %arrayidx7, align 4, !dbg !157
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !158
  %1 = bitcast i32* %arraydecay8 to i8*, !dbg !158
  %2 = load i32*, i32** %data, align 8, !dbg !158
  %3 = bitcast i32* %2 to i8*, !dbg !158
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !158
  %call10 = call i64 @wcslen(i32* noundef %arraydecay9), !dbg !158
  %mul = mul i64 %call10, 4, !dbg !158
  %call11 = call i8* @__memmove_chk(i8* noundef %1, i8* noundef %3, i64 noundef %mul, i64 noundef 400) #4, !dbg !158
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !159
  store i32 0, i32* %arrayidx12, align 4, !dbg !160
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !161
  call void @printWLine(i32* noundef %arraydecay13), !dbg !162
  ret void, !dbg !163
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!9, !10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !7, line: 25, type: !8, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_memmove_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0}
!7 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_memmove_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"PIC Level", i32 2}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"Homebrew clang version 14.0.6"}
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memmove_07_bad", scope: !7, file: !7, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !16, file: !7, line: 31, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !23, line: 34, baseType: !24)
!23 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !25, line: 106, baseType: !8)
!25 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!26 = !DILocation(line: 31, column: 15, scope: !16)
!27 = !DILocalVariable(name: "dataBadBuffer", scope: !16, file: !7, line: 32, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 1600, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 50)
!31 = !DILocation(line: 32, column: 13, scope: !16)
!32 = !DILocalVariable(name: "dataGoodBuffer", scope: !16, file: !7, line: 33, type: !33)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 3200, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 33, column: 13, scope: !16)
!37 = !DILocation(line: 34, column: 13, scope: !16)
!38 = !DILocation(line: 34, column: 5, scope: !16)
!39 = !DILocation(line: 35, column: 5, scope: !16)
!40 = !DILocation(line: 35, column: 25, scope: !16)
!41 = !DILocation(line: 36, column: 13, scope: !16)
!42 = !DILocation(line: 36, column: 5, scope: !16)
!43 = !DILocation(line: 37, column: 5, scope: !16)
!44 = !DILocation(line: 37, column: 27, scope: !16)
!45 = !DILocation(line: 38, column: 8, scope: !46)
!46 = distinct !DILexicalBlock(scope: !16, file: !7, line: 38, column: 8)
!47 = !DILocation(line: 38, column: 18, scope: !46)
!48 = !DILocation(line: 38, column: 8, scope: !16)
!49 = !DILocation(line: 41, column: 16, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !7, line: 39, column: 5)
!51 = !DILocation(line: 41, column: 14, scope: !50)
!52 = !DILocation(line: 42, column: 5, scope: !50)
!53 = !DILocalVariable(name: "dest", scope: !54, file: !7, line: 44, type: !33)
!54 = distinct !DILexicalBlock(scope: !16, file: !7, line: 43, column: 5)
!55 = !DILocation(line: 44, column: 17, scope: !54)
!56 = !DILocation(line: 45, column: 17, scope: !54)
!57 = !DILocation(line: 45, column: 9, scope: !54)
!58 = !DILocation(line: 46, column: 9, scope: !54)
!59 = !DILocation(line: 46, column: 21, scope: !54)
!60 = !DILocation(line: 49, column: 9, scope: !54)
!61 = !DILocation(line: 50, column: 9, scope: !54)
!62 = !DILocation(line: 50, column: 21, scope: !54)
!63 = !DILocation(line: 51, column: 20, scope: !54)
!64 = !DILocation(line: 51, column: 9, scope: !54)
!65 = !DILocation(line: 53, column: 1, scope: !16)
!66 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memmove_07_good", scope: !7, file: !7, line: 118, type: !17, scopeLine: 119, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!67 = !DILocation(line: 120, column: 5, scope: !66)
!68 = !DILocation(line: 121, column: 5, scope: !66)
!69 = !DILocation(line: 122, column: 1, scope: !66)
!70 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 134, type: !71, scopeLine: 135, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!71 = !DISubroutineType(types: !72)
!72 = !{!8, !8, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !7, line: 134, type: !8)
!77 = !DILocation(line: 134, column: 14, scope: !70)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !7, line: 134, type: !73)
!79 = !DILocation(line: 134, column: 27, scope: !70)
!80 = !DILocation(line: 137, column: 22, scope: !70)
!81 = !DILocation(line: 137, column: 12, scope: !70)
!82 = !DILocation(line: 137, column: 5, scope: !70)
!83 = !DILocation(line: 139, column: 5, scope: !70)
!84 = !DILocation(line: 140, column: 5, scope: !70)
!85 = !DILocation(line: 141, column: 5, scope: !70)
!86 = !DILocation(line: 144, column: 5, scope: !70)
!87 = !DILocation(line: 145, column: 5, scope: !70)
!88 = !DILocation(line: 146, column: 5, scope: !70)
!89 = !DILocation(line: 148, column: 5, scope: !70)
!90 = distinct !DISubprogram(name: "goodG2B1", scope: !7, file: !7, line: 60, type: !17, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !19)
!91 = !DILocalVariable(name: "data", scope: !90, file: !7, line: 62, type: !21)
!92 = !DILocation(line: 62, column: 15, scope: !90)
!93 = !DILocalVariable(name: "dataBadBuffer", scope: !90, file: !7, line: 63, type: !28)
!94 = !DILocation(line: 63, column: 13, scope: !90)
!95 = !DILocalVariable(name: "dataGoodBuffer", scope: !90, file: !7, line: 64, type: !33)
!96 = !DILocation(line: 64, column: 13, scope: !90)
!97 = !DILocation(line: 65, column: 13, scope: !90)
!98 = !DILocation(line: 65, column: 5, scope: !90)
!99 = !DILocation(line: 66, column: 5, scope: !90)
!100 = !DILocation(line: 66, column: 25, scope: !90)
!101 = !DILocation(line: 67, column: 13, scope: !90)
!102 = !DILocation(line: 67, column: 5, scope: !90)
!103 = !DILocation(line: 68, column: 5, scope: !90)
!104 = !DILocation(line: 68, column: 27, scope: !90)
!105 = !DILocation(line: 69, column: 8, scope: !106)
!106 = distinct !DILexicalBlock(scope: !90, file: !7, line: 69, column: 8)
!107 = !DILocation(line: 69, column: 18, scope: !106)
!108 = !DILocation(line: 69, column: 8, scope: !90)
!109 = !DILocation(line: 72, column: 9, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !7, line: 70, column: 5)
!111 = !DILocation(line: 73, column: 5, scope: !110)
!112 = !DILocation(line: 77, column: 16, scope: !113)
!113 = distinct !DILexicalBlock(scope: !106, file: !7, line: 75, column: 5)
!114 = !DILocation(line: 77, column: 14, scope: !113)
!115 = !DILocalVariable(name: "dest", scope: !116, file: !7, line: 80, type: !33)
!116 = distinct !DILexicalBlock(scope: !90, file: !7, line: 79, column: 5)
!117 = !DILocation(line: 80, column: 17, scope: !116)
!118 = !DILocation(line: 81, column: 17, scope: !116)
!119 = !DILocation(line: 81, column: 9, scope: !116)
!120 = !DILocation(line: 82, column: 9, scope: !116)
!121 = !DILocation(line: 82, column: 21, scope: !116)
!122 = !DILocation(line: 85, column: 9, scope: !116)
!123 = !DILocation(line: 86, column: 9, scope: !116)
!124 = !DILocation(line: 86, column: 21, scope: !116)
!125 = !DILocation(line: 87, column: 20, scope: !116)
!126 = !DILocation(line: 87, column: 9, scope: !116)
!127 = !DILocation(line: 89, column: 1, scope: !90)
!128 = distinct !DISubprogram(name: "goodG2B2", scope: !7, file: !7, line: 92, type: !17, scopeLine: 93, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !19)
!129 = !DILocalVariable(name: "data", scope: !128, file: !7, line: 94, type: !21)
!130 = !DILocation(line: 94, column: 15, scope: !128)
!131 = !DILocalVariable(name: "dataBadBuffer", scope: !128, file: !7, line: 95, type: !28)
!132 = !DILocation(line: 95, column: 13, scope: !128)
!133 = !DILocalVariable(name: "dataGoodBuffer", scope: !128, file: !7, line: 96, type: !33)
!134 = !DILocation(line: 96, column: 13, scope: !128)
!135 = !DILocation(line: 97, column: 13, scope: !128)
!136 = !DILocation(line: 97, column: 5, scope: !128)
!137 = !DILocation(line: 98, column: 5, scope: !128)
!138 = !DILocation(line: 98, column: 25, scope: !128)
!139 = !DILocation(line: 99, column: 13, scope: !128)
!140 = !DILocation(line: 99, column: 5, scope: !128)
!141 = !DILocation(line: 100, column: 5, scope: !128)
!142 = !DILocation(line: 100, column: 27, scope: !128)
!143 = !DILocation(line: 101, column: 8, scope: !144)
!144 = distinct !DILexicalBlock(scope: !128, file: !7, line: 101, column: 8)
!145 = !DILocation(line: 101, column: 18, scope: !144)
!146 = !DILocation(line: 101, column: 8, scope: !128)
!147 = !DILocation(line: 104, column: 16, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !7, line: 102, column: 5)
!149 = !DILocation(line: 104, column: 14, scope: !148)
!150 = !DILocation(line: 105, column: 5, scope: !148)
!151 = !DILocalVariable(name: "dest", scope: !152, file: !7, line: 107, type: !33)
!152 = distinct !DILexicalBlock(scope: !128, file: !7, line: 106, column: 5)
!153 = !DILocation(line: 107, column: 17, scope: !152)
!154 = !DILocation(line: 108, column: 17, scope: !152)
!155 = !DILocation(line: 108, column: 9, scope: !152)
!156 = !DILocation(line: 109, column: 9, scope: !152)
!157 = !DILocation(line: 109, column: 21, scope: !152)
!158 = !DILocation(line: 112, column: 9, scope: !152)
!159 = !DILocation(line: 113, column: 9, scope: !152)
!160 = !DILocation(line: 113, column: 21, scope: !152)
!161 = !DILocation(line: 114, column: 20, scope: !152)
!162 = !DILocation(line: 114, column: 9, scope: !152)
!163 = !DILocation(line: 116, column: 1, scope: !128)
