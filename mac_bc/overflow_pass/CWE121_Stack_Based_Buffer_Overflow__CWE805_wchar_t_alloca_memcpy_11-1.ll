; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_11-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_11-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_11_bad() #0 !dbg !17 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 200, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = alloca i8, i64 400, align 16, !dbg !30
  %3 = bitcast i8* %2 to i32*, !dbg !31
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !29
  %call = call i32 (...) @globalReturnsTrue(), !dbg !32
  %tobool = icmp ne i32 %call, 0, !dbg !32
  br i1 %tobool, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !35
  store i32* %4, i32** %data, align 8, !dbg !37
  %5 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !41, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !47
  %call1 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !48
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !49
  store i32 0, i32* %arrayidx2, align 4, !dbg !50
  %6 = load i32*, i32** %data, align 8, !dbg !51
  %7 = bitcast i32* %6 to i8*, !dbg !51
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !51
  %8 = bitcast i32* %arraydecay3 to i8*, !dbg !51
  %9 = load i32*, i32** %data, align 8, !dbg !51
  %10 = bitcast i32* %9 to i8*, !dbg !51
  %11 = call i64 @llvm.objectsize.i64.p0i8(i8* %10, i1 false, i1 true, i1 false), !dbg !51
  %call4 = call i8* @__memcpy_chk(i8* noundef %7, i8* noundef %8, i64 noundef 400, i64 noundef %11) #4, !dbg !51
  %12 = load i32*, i32** %data, align 8, !dbg !52
  %arrayidx5 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !52
  store i32 0, i32* %arrayidx5, align 4, !dbg !53
  %13 = load i32*, i32** %data, align 8, !dbg !54
  call void @printWLine(i32* noundef %13), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrue(...) #2

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_11_good() #0 !dbg !57 {
entry:
  call void @goodG2B1(), !dbg !58
  call void @goodG2B2(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* noundef null), !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 noundef %conv), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_11_good(), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_11_bad(), !dbg !78
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !81 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  %0 = alloca i8, i64 200, align 16, !dbg !86
  %1 = bitcast i8* %0 to i32*, !dbg !87
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  %2 = alloca i8, i64 400, align 16, !dbg !90
  %3 = bitcast i8* %2 to i32*, !dbg !91
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !89
  %call = call i32 (...) @globalReturnsFalse(), !dbg !92
  %tobool = icmp ne i32 %call, 0, !dbg !92
  br i1 %tobool, label %if.then, label %if.else, !dbg !94

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !95
  br label %if.end, !dbg !97

if.else:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !98
  store i32* %4, i32** %data, align 8, !dbg !100
  %5 = load i32*, i32** %data, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !101
  store i32 0, i32* %arrayidx, align 4, !dbg !102
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !103, metadata !DIExpression()), !dbg !105
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !106
  %call1 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !107
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !108
  store i32 0, i32* %arrayidx2, align 4, !dbg !109
  %6 = load i32*, i32** %data, align 8, !dbg !110
  %7 = bitcast i32* %6 to i8*, !dbg !110
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !110
  %8 = bitcast i32* %arraydecay3 to i8*, !dbg !110
  %9 = load i32*, i32** %data, align 8, !dbg !110
  %10 = bitcast i32* %9 to i8*, !dbg !110
  %11 = call i64 @llvm.objectsize.i64.p0i8(i8* %10, i1 false, i1 true, i1 false), !dbg !110
  %call4 = call i8* @__memcpy_chk(i8* noundef %7, i8* noundef %8, i64 noundef 400, i64 noundef %11) #4, !dbg !110
  %12 = load i32*, i32** %data, align 8, !dbg !111
  %arrayidx5 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !111
  store i32 0, i32* %arrayidx5, align 4, !dbg !112
  %13 = load i32*, i32** %data, align 8, !dbg !113
  call void @printWLine(i32* noundef %13), !dbg !114
  ret void, !dbg !115
}

declare i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !116 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !119, metadata !DIExpression()), !dbg !120
  %0 = alloca i8, i64 200, align 16, !dbg !121
  %1 = bitcast i8* %0 to i32*, !dbg !122
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !120
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !123, metadata !DIExpression()), !dbg !124
  %2 = alloca i8, i64 400, align 16, !dbg !125
  %3 = bitcast i8* %2 to i32*, !dbg !126
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !124
  %call = call i32 (...) @globalReturnsTrue(), !dbg !127
  %tobool = icmp ne i32 %call, 0, !dbg !127
  br i1 %tobool, label %if.then, label %if.end, !dbg !129

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !130
  store i32* %4, i32** %data, align 8, !dbg !132
  %5 = load i32*, i32** %data, align 8, !dbg !133
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !133
  store i32 0, i32* %arrayidx, align 4, !dbg !134
  br label %if.end, !dbg !135

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !136, metadata !DIExpression()), !dbg !138
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !139
  %call1 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !140
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !141
  store i32 0, i32* %arrayidx2, align 4, !dbg !142
  %6 = load i32*, i32** %data, align 8, !dbg !143
  %7 = bitcast i32* %6 to i8*, !dbg !143
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !143
  %8 = bitcast i32* %arraydecay3 to i8*, !dbg !143
  %9 = load i32*, i32** %data, align 8, !dbg !143
  %10 = bitcast i32* %9 to i8*, !dbg !143
  %11 = call i64 @llvm.objectsize.i64.p0i8(i8* %10, i1 false, i1 true, i1 false), !dbg !143
  %call4 = call i8* @__memcpy_chk(i8* noundef %7, i8* noundef %8, i64 noundef 400, i64 noundef %11) #4, !dbg !143
  %12 = load i32*, i32** %data, align 8, !dbg !144
  %arrayidx5 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !144
  store i32 0, i32* %arrayidx5, align 4, !dbg !145
  %13 = load i32*, i32** %data, align 8, !dbg !146
  call void @printWLine(i32* noundef %13), !dbg !147
  ret void, !dbg !148
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !9}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !5, line: 34, baseType: !6)
!5 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !7, line: 106, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"PIC Level", i32 2}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"Homebrew clang version 14.0.6"}
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_11_bad", scope: !18, file: !18, line: 23, type: !19, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 25, type: !3)
!23 = !DILocation(line: 25, column: 15, scope: !17)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 26, type: !3)
!25 = !DILocation(line: 26, column: 15, scope: !17)
!26 = !DILocation(line: 26, column: 42, scope: !17)
!27 = !DILocation(line: 26, column: 31, scope: !17)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 27, type: !3)
!29 = !DILocation(line: 27, column: 15, scope: !17)
!30 = !DILocation(line: 27, column: 43, scope: !17)
!31 = !DILocation(line: 27, column: 32, scope: !17)
!32 = !DILocation(line: 28, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !17, file: !18, line: 28, column: 8)
!34 = !DILocation(line: 28, column: 8, scope: !17)
!35 = !DILocation(line: 32, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !18, line: 29, column: 5)
!37 = !DILocation(line: 32, column: 14, scope: !36)
!38 = !DILocation(line: 33, column: 9, scope: !36)
!39 = !DILocation(line: 33, column: 17, scope: !36)
!40 = !DILocation(line: 34, column: 5, scope: !36)
!41 = !DILocalVariable(name: "source", scope: !42, file: !18, line: 36, type: !43)
!42 = distinct !DILexicalBlock(scope: !17, file: !18, line: 35, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 100)
!46 = !DILocation(line: 36, column: 17, scope: !42)
!47 = !DILocation(line: 37, column: 17, scope: !42)
!48 = !DILocation(line: 37, column: 9, scope: !42)
!49 = !DILocation(line: 38, column: 9, scope: !42)
!50 = !DILocation(line: 38, column: 23, scope: !42)
!51 = !DILocation(line: 40, column: 9, scope: !42)
!52 = !DILocation(line: 41, column: 9, scope: !42)
!53 = !DILocation(line: 41, column: 21, scope: !42)
!54 = !DILocation(line: 42, column: 20, scope: !42)
!55 = !DILocation(line: 42, column: 9, scope: !42)
!56 = !DILocation(line: 44, column: 1, scope: !17)
!57 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_11_good", scope: !18, file: !18, line: 101, type: !19, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!58 = !DILocation(line: 103, column: 5, scope: !57)
!59 = !DILocation(line: 104, column: 5, scope: !57)
!60 = !DILocation(line: 105, column: 1, scope: !57)
!61 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 117, type: !62, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!62 = !DISubroutineType(types: !63)
!63 = !{!8, !8, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !18, line: 117, type: !8)
!68 = !DILocation(line: 117, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !18, line: 117, type: !64)
!70 = !DILocation(line: 117, column: 27, scope: !61)
!71 = !DILocation(line: 120, column: 22, scope: !61)
!72 = !DILocation(line: 120, column: 12, scope: !61)
!73 = !DILocation(line: 120, column: 5, scope: !61)
!74 = !DILocation(line: 122, column: 5, scope: !61)
!75 = !DILocation(line: 123, column: 5, scope: !61)
!76 = !DILocation(line: 124, column: 5, scope: !61)
!77 = !DILocation(line: 127, column: 5, scope: !61)
!78 = !DILocation(line: 128, column: 5, scope: !61)
!79 = !DILocation(line: 129, column: 5, scope: !61)
!80 = !DILocation(line: 131, column: 5, scope: !61)
!81 = distinct !DISubprogram(name: "goodG2B1", scope: !18, file: !18, line: 51, type: !19, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!82 = !DILocalVariable(name: "data", scope: !81, file: !18, line: 53, type: !3)
!83 = !DILocation(line: 53, column: 15, scope: !81)
!84 = !DILocalVariable(name: "dataBadBuffer", scope: !81, file: !18, line: 54, type: !3)
!85 = !DILocation(line: 54, column: 15, scope: !81)
!86 = !DILocation(line: 54, column: 42, scope: !81)
!87 = !DILocation(line: 54, column: 31, scope: !81)
!88 = !DILocalVariable(name: "dataGoodBuffer", scope: !81, file: !18, line: 55, type: !3)
!89 = !DILocation(line: 55, column: 15, scope: !81)
!90 = !DILocation(line: 55, column: 43, scope: !81)
!91 = !DILocation(line: 55, column: 32, scope: !81)
!92 = !DILocation(line: 56, column: 8, scope: !93)
!93 = distinct !DILexicalBlock(scope: !81, file: !18, line: 56, column: 8)
!94 = !DILocation(line: 56, column: 8, scope: !81)
!95 = !DILocation(line: 59, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !18, line: 57, column: 5)
!97 = !DILocation(line: 60, column: 5, scope: !96)
!98 = !DILocation(line: 64, column: 16, scope: !99)
!99 = distinct !DILexicalBlock(scope: !93, file: !18, line: 62, column: 5)
!100 = !DILocation(line: 64, column: 14, scope: !99)
!101 = !DILocation(line: 65, column: 9, scope: !99)
!102 = !DILocation(line: 65, column: 17, scope: !99)
!103 = !DILocalVariable(name: "source", scope: !104, file: !18, line: 68, type: !43)
!104 = distinct !DILexicalBlock(scope: !81, file: !18, line: 67, column: 5)
!105 = !DILocation(line: 68, column: 17, scope: !104)
!106 = !DILocation(line: 69, column: 17, scope: !104)
!107 = !DILocation(line: 69, column: 9, scope: !104)
!108 = !DILocation(line: 70, column: 9, scope: !104)
!109 = !DILocation(line: 70, column: 23, scope: !104)
!110 = !DILocation(line: 72, column: 9, scope: !104)
!111 = !DILocation(line: 73, column: 9, scope: !104)
!112 = !DILocation(line: 73, column: 21, scope: !104)
!113 = !DILocation(line: 74, column: 20, scope: !104)
!114 = !DILocation(line: 74, column: 9, scope: !104)
!115 = !DILocation(line: 76, column: 1, scope: !81)
!116 = distinct !DISubprogram(name: "goodG2B2", scope: !18, file: !18, line: 79, type: !19, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!117 = !DILocalVariable(name: "data", scope: !116, file: !18, line: 81, type: !3)
!118 = !DILocation(line: 81, column: 15, scope: !116)
!119 = !DILocalVariable(name: "dataBadBuffer", scope: !116, file: !18, line: 82, type: !3)
!120 = !DILocation(line: 82, column: 15, scope: !116)
!121 = !DILocation(line: 82, column: 42, scope: !116)
!122 = !DILocation(line: 82, column: 31, scope: !116)
!123 = !DILocalVariable(name: "dataGoodBuffer", scope: !116, file: !18, line: 83, type: !3)
!124 = !DILocation(line: 83, column: 15, scope: !116)
!125 = !DILocation(line: 83, column: 43, scope: !116)
!126 = !DILocation(line: 83, column: 32, scope: !116)
!127 = !DILocation(line: 84, column: 8, scope: !128)
!128 = distinct !DILexicalBlock(scope: !116, file: !18, line: 84, column: 8)
!129 = !DILocation(line: 84, column: 8, scope: !116)
!130 = !DILocation(line: 87, column: 16, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !18, line: 85, column: 5)
!132 = !DILocation(line: 87, column: 14, scope: !131)
!133 = !DILocation(line: 88, column: 9, scope: !131)
!134 = !DILocation(line: 88, column: 17, scope: !131)
!135 = !DILocation(line: 89, column: 5, scope: !131)
!136 = !DILocalVariable(name: "source", scope: !137, file: !18, line: 91, type: !43)
!137 = distinct !DILexicalBlock(scope: !116, file: !18, line: 90, column: 5)
!138 = !DILocation(line: 91, column: 17, scope: !137)
!139 = !DILocation(line: 92, column: 17, scope: !137)
!140 = !DILocation(line: 92, column: 9, scope: !137)
!141 = !DILocation(line: 93, column: 9, scope: !137)
!142 = !DILocation(line: 93, column: 23, scope: !137)
!143 = !DILocation(line: 95, column: 9, scope: !137)
!144 = !DILocation(line: 96, column: 9, scope: !137)
!145 = !DILocation(line: 96, column: 21, scope: !137)
!146 = !DILocation(line: 97, column: 20, scope: !137)
!147 = !DILocation(line: 97, column: 9, scope: !137)
!148 = !DILocation(line: 99, column: 1, scope: !116)
