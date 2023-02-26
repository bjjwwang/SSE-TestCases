; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_07-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_07-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !32, metadata !DIExpression()), !dbg !36
  %0 = load i32, i32* @staticFive, align 4, !dbg !37
  %cmp = icmp eq i32 %0, 5, !dbg !39
  br i1 %cmp, label %if.then, label %if.end, !dbg !40

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !41
  store i32* %arraydecay, i32** %data, align 8, !dbg !43
  %1 = load i32*, i32** %data, align 8, !dbg !44
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !44
  store i32 0, i32* %arrayidx, align 4, !dbg !45
  br label %if.end, !dbg !46

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !47, metadata !DIExpression()), !dbg !49
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !50
  %call = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 67, i64 noundef 99), !dbg !51
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !52
  store i32 0, i32* %arrayidx2, align 4, !dbg !53
  %2 = load i32*, i32** %data, align 8, !dbg !54
  %3 = bitcast i32* %2 to i8*, !dbg !54
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !54
  %4 = bitcast i32* %arraydecay3 to i8*, !dbg !54
  %5 = load i32*, i32** %data, align 8, !dbg !54
  %6 = bitcast i32* %5 to i8*, !dbg !54
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !54
  %call4 = call i8* @__memcpy_chk(i8* noundef %3, i8* noundef %4, i64 noundef 400, i64 noundef %7) #4, !dbg !54
  %8 = load i32*, i32** %data, align 8, !dbg !55
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !55
  store i32 0, i32* %arrayidx5, align 4, !dbg !56
  %9 = load i32*, i32** %data, align 8, !dbg !57
  call void @printWLine(i32* noundef %9), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_07_good() #0 !dbg !60 {
entry:
  call void @goodG2B1(), !dbg !61
  call void @goodG2B2(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i64 @time(i64* noundef null), !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 noundef %conv), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_07_good(), !dbg !78
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_07_bad(), !dbg !81
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !84 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  %0 = load i32, i32* @staticFive, align 4, !dbg !91
  %cmp = icmp ne i32 %0, 5, !dbg !93
  br i1 %cmp, label %if.then, label %if.else, !dbg !94

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !95
  br label %if.end, !dbg !97

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !98
  store i32* %arraydecay, i32** %data, align 8, !dbg !100
  %1 = load i32*, i32** %data, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !101
  store i32 0, i32* %arrayidx, align 4, !dbg !102
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !103, metadata !DIExpression()), !dbg !105
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !106
  %call = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 67, i64 noundef 99), !dbg !107
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !108
  store i32 0, i32* %arrayidx2, align 4, !dbg !109
  %2 = load i32*, i32** %data, align 8, !dbg !110
  %3 = bitcast i32* %2 to i8*, !dbg !110
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !110
  %4 = bitcast i32* %arraydecay3 to i8*, !dbg !110
  %5 = load i32*, i32** %data, align 8, !dbg !110
  %6 = bitcast i32* %5 to i8*, !dbg !110
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !110
  %call4 = call i8* @__memcpy_chk(i8* noundef %3, i8* noundef %4, i64 noundef 400, i64 noundef %7) #4, !dbg !110
  %8 = load i32*, i32** %data, align 8, !dbg !111
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !111
  store i32 0, i32* %arrayidx5, align 4, !dbg !112
  %9 = load i32*, i32** %data, align 8, !dbg !113
  call void @printWLine(i32* noundef %9), !dbg !114
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !116 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !119, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !121, metadata !DIExpression()), !dbg !122
  %0 = load i32, i32* @staticFive, align 4, !dbg !123
  %cmp = icmp eq i32 %0, 5, !dbg !125
  br i1 %cmp, label %if.then, label %if.end, !dbg !126

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !127
  store i32* %arraydecay, i32** %data, align 8, !dbg !129
  %1 = load i32*, i32** %data, align 8, !dbg !130
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !130
  store i32 0, i32* %arrayidx, align 4, !dbg !131
  br label %if.end, !dbg !132

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !133, metadata !DIExpression()), !dbg !135
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !136
  %call = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 67, i64 noundef 99), !dbg !137
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !138
  store i32 0, i32* %arrayidx2, align 4, !dbg !139
  %2 = load i32*, i32** %data, align 8, !dbg !140
  %3 = bitcast i32* %2 to i8*, !dbg !140
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !140
  %4 = bitcast i32* %arraydecay3 to i8*, !dbg !140
  %5 = load i32*, i32** %data, align 8, !dbg !140
  %6 = bitcast i32* %5 to i8*, !dbg !140
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !140
  %call4 = call i8* @__memcpy_chk(i8* noundef %3, i8* noundef %4, i64 noundef 400, i64 noundef %7) #4, !dbg !140
  %8 = load i32*, i32** %data, align 8, !dbg !141
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !141
  store i32 0, i32* %arrayidx5, align 4, !dbg !142
  %9 = load i32*, i32** %data, align 8, !dbg !143
  call void @printWLine(i32* noundef %9), !dbg !144
  ret void, !dbg !145
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
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0}
!7 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"PIC Level", i32 2}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"Homebrew clang version 14.0.6"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_07_bad", scope: !7, file: !7, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
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
!37 = !DILocation(line: 34, column: 8, scope: !38)
!38 = distinct !DILexicalBlock(scope: !16, file: !7, line: 34, column: 8)
!39 = !DILocation(line: 34, column: 18, scope: !38)
!40 = !DILocation(line: 34, column: 8, scope: !16)
!41 = !DILocation(line: 38, column: 16, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !7, line: 35, column: 5)
!43 = !DILocation(line: 38, column: 14, scope: !42)
!44 = !DILocation(line: 39, column: 9, scope: !42)
!45 = !DILocation(line: 39, column: 17, scope: !42)
!46 = !DILocation(line: 40, column: 5, scope: !42)
!47 = !DILocalVariable(name: "source", scope: !48, file: !7, line: 42, type: !33)
!48 = distinct !DILexicalBlock(scope: !16, file: !7, line: 41, column: 5)
!49 = !DILocation(line: 42, column: 17, scope: !48)
!50 = !DILocation(line: 43, column: 17, scope: !48)
!51 = !DILocation(line: 43, column: 9, scope: !48)
!52 = !DILocation(line: 44, column: 9, scope: !48)
!53 = !DILocation(line: 44, column: 23, scope: !48)
!54 = !DILocation(line: 46, column: 9, scope: !48)
!55 = !DILocation(line: 47, column: 9, scope: !48)
!56 = !DILocation(line: 47, column: 21, scope: !48)
!57 = !DILocation(line: 48, column: 20, scope: !48)
!58 = !DILocation(line: 48, column: 9, scope: !48)
!59 = !DILocation(line: 50, column: 1, scope: !16)
!60 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_07_good", scope: !7, file: !7, line: 107, type: !17, scopeLine: 108, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!61 = !DILocation(line: 109, column: 5, scope: !60)
!62 = !DILocation(line: 110, column: 5, scope: !60)
!63 = !DILocation(line: 111, column: 1, scope: !60)
!64 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 123, type: !65, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!65 = !DISubroutineType(types: !66)
!66 = !{!8, !8, !67}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !7, line: 123, type: !8)
!71 = !DILocation(line: 123, column: 14, scope: !64)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !7, line: 123, type: !67)
!73 = !DILocation(line: 123, column: 27, scope: !64)
!74 = !DILocation(line: 126, column: 22, scope: !64)
!75 = !DILocation(line: 126, column: 12, scope: !64)
!76 = !DILocation(line: 126, column: 5, scope: !64)
!77 = !DILocation(line: 128, column: 5, scope: !64)
!78 = !DILocation(line: 129, column: 5, scope: !64)
!79 = !DILocation(line: 130, column: 5, scope: !64)
!80 = !DILocation(line: 133, column: 5, scope: !64)
!81 = !DILocation(line: 134, column: 5, scope: !64)
!82 = !DILocation(line: 135, column: 5, scope: !64)
!83 = !DILocation(line: 137, column: 5, scope: !64)
!84 = distinct !DISubprogram(name: "goodG2B1", scope: !7, file: !7, line: 57, type: !17, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !19)
!85 = !DILocalVariable(name: "data", scope: !84, file: !7, line: 59, type: !21)
!86 = !DILocation(line: 59, column: 15, scope: !84)
!87 = !DILocalVariable(name: "dataBadBuffer", scope: !84, file: !7, line: 60, type: !28)
!88 = !DILocation(line: 60, column: 13, scope: !84)
!89 = !DILocalVariable(name: "dataGoodBuffer", scope: !84, file: !7, line: 61, type: !33)
!90 = !DILocation(line: 61, column: 13, scope: !84)
!91 = !DILocation(line: 62, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !84, file: !7, line: 62, column: 8)
!93 = !DILocation(line: 62, column: 18, scope: !92)
!94 = !DILocation(line: 62, column: 8, scope: !84)
!95 = !DILocation(line: 65, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !7, line: 63, column: 5)
!97 = !DILocation(line: 66, column: 5, scope: !96)
!98 = !DILocation(line: 70, column: 16, scope: !99)
!99 = distinct !DILexicalBlock(scope: !92, file: !7, line: 68, column: 5)
!100 = !DILocation(line: 70, column: 14, scope: !99)
!101 = !DILocation(line: 71, column: 9, scope: !99)
!102 = !DILocation(line: 71, column: 17, scope: !99)
!103 = !DILocalVariable(name: "source", scope: !104, file: !7, line: 74, type: !33)
!104 = distinct !DILexicalBlock(scope: !84, file: !7, line: 73, column: 5)
!105 = !DILocation(line: 74, column: 17, scope: !104)
!106 = !DILocation(line: 75, column: 17, scope: !104)
!107 = !DILocation(line: 75, column: 9, scope: !104)
!108 = !DILocation(line: 76, column: 9, scope: !104)
!109 = !DILocation(line: 76, column: 23, scope: !104)
!110 = !DILocation(line: 78, column: 9, scope: !104)
!111 = !DILocation(line: 79, column: 9, scope: !104)
!112 = !DILocation(line: 79, column: 21, scope: !104)
!113 = !DILocation(line: 80, column: 20, scope: !104)
!114 = !DILocation(line: 80, column: 9, scope: !104)
!115 = !DILocation(line: 82, column: 1, scope: !84)
!116 = distinct !DISubprogram(name: "goodG2B2", scope: !7, file: !7, line: 85, type: !17, scopeLine: 86, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !19)
!117 = !DILocalVariable(name: "data", scope: !116, file: !7, line: 87, type: !21)
!118 = !DILocation(line: 87, column: 15, scope: !116)
!119 = !DILocalVariable(name: "dataBadBuffer", scope: !116, file: !7, line: 88, type: !28)
!120 = !DILocation(line: 88, column: 13, scope: !116)
!121 = !DILocalVariable(name: "dataGoodBuffer", scope: !116, file: !7, line: 89, type: !33)
!122 = !DILocation(line: 89, column: 13, scope: !116)
!123 = !DILocation(line: 90, column: 8, scope: !124)
!124 = distinct !DILexicalBlock(scope: !116, file: !7, line: 90, column: 8)
!125 = !DILocation(line: 90, column: 18, scope: !124)
!126 = !DILocation(line: 90, column: 8, scope: !116)
!127 = !DILocation(line: 93, column: 16, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !7, line: 91, column: 5)
!129 = !DILocation(line: 93, column: 14, scope: !128)
!130 = !DILocation(line: 94, column: 9, scope: !128)
!131 = !DILocation(line: 94, column: 17, scope: !128)
!132 = !DILocation(line: 95, column: 5, scope: !128)
!133 = !DILocalVariable(name: "source", scope: !134, file: !7, line: 97, type: !33)
!134 = distinct !DILexicalBlock(scope: !116, file: !7, line: 96, column: 5)
!135 = !DILocation(line: 97, column: 17, scope: !134)
!136 = !DILocation(line: 98, column: 17, scope: !134)
!137 = !DILocation(line: 98, column: 9, scope: !134)
!138 = !DILocation(line: 99, column: 9, scope: !134)
!139 = !DILocation(line: 99, column: 23, scope: !134)
!140 = !DILocation(line: 101, column: 9, scope: !134)
!141 = !DILocation(line: 102, column: 9, scope: !134)
!142 = !DILocation(line: 102, column: 21, scope: !134)
!143 = !DILocation(line: 103, column: 20, scope: !134)
!144 = !DILocation(line: 103, column: 9, scope: !134)
!145 = !DILocation(line: 105, column: 1, scope: !116)
