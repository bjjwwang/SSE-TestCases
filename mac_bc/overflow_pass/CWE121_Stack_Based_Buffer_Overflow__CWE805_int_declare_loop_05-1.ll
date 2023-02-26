; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_05-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_05-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !7
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  %0 = load i32, i32* @staticTrue, align 4, !dbg !35
  %tobool = icmp ne i32 %0, 0, !dbg !35
  br i1 %tobool, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  store i32* %arraydecay, i32** %data, align 8, !dbg !40
  br label %if.end, !dbg !41

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !42, metadata !DIExpression()), !dbg !44
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !52
  store i64 0, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !56
  %cmp = icmp ult i64 %2, 100, !dbg !58
  br i1 %cmp, label %for.body, label %for.end, !dbg !59

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !62
  %4 = load i32, i32* %arrayidx, align 4, !dbg !62
  %5 = load i32*, i32** %data, align 8, !dbg !63
  %6 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !63
  store i32 %4, i32* %arrayidx1, align 4, !dbg !65
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !67
  %inc = add i64 %7, 1, !dbg !67
  store i64 %inc, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !68, !llvm.loop !69

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !72
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !72
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !72
  call void @printIntLine(i32 noundef %9), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printIntLine(i32 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_05_good() #0 !dbg !75 {
entry:
  call void @goodG2B1(), !dbg !76
  call void @goodG2B2(), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !79 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i64 @time(i64* noundef null), !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 noundef %conv), !dbg !91
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_05_good(), !dbg !93
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_05_bad(), !dbg !96
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !99 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %0 = load i32, i32* @staticFalse, align 4, !dbg !106
  %tobool = icmp ne i32 %0, 0, !dbg !106
  br i1 %tobool, label %if.then, label %if.else, !dbg !108

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !109
  br label %if.end, !dbg !111

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !112
  store i32* %arraydecay, i32** %data, align 8, !dbg !114
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !115, metadata !DIExpression()), !dbg !117
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !117
  call void @llvm.dbg.declare(metadata i64* %i, metadata !118, metadata !DIExpression()), !dbg !120
  store i64 0, i64* %i, align 8, !dbg !121
  br label %for.cond, !dbg !123

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !124
  %cmp = icmp ult i64 %2, 100, !dbg !126
  br i1 %cmp, label %for.body, label %for.end, !dbg !127

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !128
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !130
  %4 = load i32, i32* %arrayidx, align 4, !dbg !130
  %5 = load i32*, i32** %data, align 8, !dbg !131
  %6 = load i64, i64* %i, align 8, !dbg !132
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !131
  store i32 %4, i32* %arrayidx1, align 4, !dbg !133
  br label %for.inc, !dbg !134

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !135
  %inc = add i64 %7, 1, !dbg !135
  store i64 %inc, i64* %i, align 8, !dbg !135
  br label %for.cond, !dbg !136, !llvm.loop !137

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !139
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !139
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !139
  call void @printIntLine(i32 noundef %9), !dbg !140
  ret void, !dbg !141
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !142 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !143, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !145, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !147, metadata !DIExpression()), !dbg !148
  %0 = load i32, i32* @staticTrue, align 4, !dbg !149
  %tobool = icmp ne i32 %0, 0, !dbg !149
  br i1 %tobool, label %if.then, label %if.end, !dbg !151

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !152
  store i32* %arraydecay, i32** %data, align 8, !dbg !154
  br label %if.end, !dbg !155

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !156, metadata !DIExpression()), !dbg !158
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !158
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !158
  call void @llvm.dbg.declare(metadata i64* %i, metadata !159, metadata !DIExpression()), !dbg !161
  store i64 0, i64* %i, align 8, !dbg !162
  br label %for.cond, !dbg !164

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !165
  %cmp = icmp ult i64 %2, 100, !dbg !167
  br i1 %cmp, label %for.body, label %for.end, !dbg !168

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !169
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !171
  %4 = load i32, i32* %arrayidx, align 4, !dbg !171
  %5 = load i32*, i32** %data, align 8, !dbg !172
  %6 = load i64, i64* %i, align 8, !dbg !173
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !172
  store i32 %4, i32* %arrayidx1, align 4, !dbg !174
  br label %for.inc, !dbg !175

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !176
  %inc = add i64 %7, 1, !dbg !176
  store i64 %inc, i64* %i, align 8, !dbg !176
  br label %for.cond, !dbg !177, !llvm.loop !178

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !180
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !180
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !180
  call void @printIntLine(i32 noundef %9), !dbg !181
  ret void, !dbg !182
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !9, line: 23, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0, !7}
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !9, line: 24, type: !10, isLocal: true, isDefinition: true)
!9 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Homebrew clang version 14.0.6"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_05_bad", scope: !9, file: !9, line: 28, type: !19, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !9, line: 30, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!24 = !DILocation(line: 30, column: 11, scope: !18)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !9, line: 31, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 1600, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 31, column: 9, scope: !18)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !18, file: !9, line: 32, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 3200, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 32, column: 9, scope: !18)
!35 = !DILocation(line: 33, column: 8, scope: !36)
!36 = distinct !DILexicalBlock(scope: !18, file: !9, line: 33, column: 8)
!37 = !DILocation(line: 33, column: 8, scope: !18)
!38 = !DILocation(line: 37, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !9, line: 34, column: 5)
!40 = !DILocation(line: 37, column: 14, scope: !39)
!41 = !DILocation(line: 38, column: 5, scope: !39)
!42 = !DILocalVariable(name: "source", scope: !43, file: !9, line: 40, type: !31)
!43 = distinct !DILexicalBlock(scope: !18, file: !9, line: 39, column: 5)
!44 = !DILocation(line: 40, column: 13, scope: !43)
!45 = !DILocalVariable(name: "i", scope: !46, file: !9, line: 42, type: !47)
!46 = distinct !DILexicalBlock(scope: !43, file: !9, line: 41, column: 9)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !48, line: 31, baseType: !49)
!48 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !50, line: 94, baseType: !51)
!50 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!51 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 42, column: 20, scope: !46)
!53 = !DILocation(line: 44, column: 20, scope: !54)
!54 = distinct !DILexicalBlock(scope: !46, file: !9, line: 44, column: 13)
!55 = !DILocation(line: 44, column: 18, scope: !54)
!56 = !DILocation(line: 44, column: 25, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !9, line: 44, column: 13)
!58 = !DILocation(line: 44, column: 27, scope: !57)
!59 = !DILocation(line: 44, column: 13, scope: !54)
!60 = !DILocation(line: 46, column: 34, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !9, line: 45, column: 13)
!62 = !DILocation(line: 46, column: 27, scope: !61)
!63 = !DILocation(line: 46, column: 17, scope: !61)
!64 = !DILocation(line: 46, column: 22, scope: !61)
!65 = !DILocation(line: 46, column: 25, scope: !61)
!66 = !DILocation(line: 47, column: 13, scope: !61)
!67 = !DILocation(line: 44, column: 35, scope: !57)
!68 = !DILocation(line: 44, column: 13, scope: !57)
!69 = distinct !{!69, !59, !70, !71}
!70 = !DILocation(line: 47, column: 13, scope: !54)
!71 = !{!"llvm.loop.mustprogress"}
!72 = !DILocation(line: 48, column: 26, scope: !46)
!73 = !DILocation(line: 48, column: 13, scope: !46)
!74 = !DILocation(line: 51, column: 1, scope: !18)
!75 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_05_good", scope: !9, file: !9, line: 112, type: !19, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!76 = !DILocation(line: 114, column: 5, scope: !75)
!77 = !DILocation(line: 115, column: 5, scope: !75)
!78 = !DILocation(line: 116, column: 1, scope: !75)
!79 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 128, type: !80, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!80 = !DISubroutineType(types: !81)
!81 = !{!10, !10, !82}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !9, line: 128, type: !10)
!86 = !DILocation(line: 128, column: 14, scope: !79)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !9, line: 128, type: !82)
!88 = !DILocation(line: 128, column: 27, scope: !79)
!89 = !DILocation(line: 131, column: 22, scope: !79)
!90 = !DILocation(line: 131, column: 12, scope: !79)
!91 = !DILocation(line: 131, column: 5, scope: !79)
!92 = !DILocation(line: 133, column: 5, scope: !79)
!93 = !DILocation(line: 134, column: 5, scope: !79)
!94 = !DILocation(line: 135, column: 5, scope: !79)
!95 = !DILocation(line: 138, column: 5, scope: !79)
!96 = !DILocation(line: 139, column: 5, scope: !79)
!97 = !DILocation(line: 140, column: 5, scope: !79)
!98 = !DILocation(line: 142, column: 5, scope: !79)
!99 = distinct !DISubprogram(name: "goodG2B1", scope: !9, file: !9, line: 58, type: !19, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!100 = !DILocalVariable(name: "data", scope: !99, file: !9, line: 60, type: !23)
!101 = !DILocation(line: 60, column: 11, scope: !99)
!102 = !DILocalVariable(name: "dataBadBuffer", scope: !99, file: !9, line: 61, type: !26)
!103 = !DILocation(line: 61, column: 9, scope: !99)
!104 = !DILocalVariable(name: "dataGoodBuffer", scope: !99, file: !9, line: 62, type: !31)
!105 = !DILocation(line: 62, column: 9, scope: !99)
!106 = !DILocation(line: 63, column: 8, scope: !107)
!107 = distinct !DILexicalBlock(scope: !99, file: !9, line: 63, column: 8)
!108 = !DILocation(line: 63, column: 8, scope: !99)
!109 = !DILocation(line: 66, column: 9, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !9, line: 64, column: 5)
!111 = !DILocation(line: 67, column: 5, scope: !110)
!112 = !DILocation(line: 71, column: 16, scope: !113)
!113 = distinct !DILexicalBlock(scope: !107, file: !9, line: 69, column: 5)
!114 = !DILocation(line: 71, column: 14, scope: !113)
!115 = !DILocalVariable(name: "source", scope: !116, file: !9, line: 74, type: !31)
!116 = distinct !DILexicalBlock(scope: !99, file: !9, line: 73, column: 5)
!117 = !DILocation(line: 74, column: 13, scope: !116)
!118 = !DILocalVariable(name: "i", scope: !119, file: !9, line: 76, type: !47)
!119 = distinct !DILexicalBlock(scope: !116, file: !9, line: 75, column: 9)
!120 = !DILocation(line: 76, column: 20, scope: !119)
!121 = !DILocation(line: 78, column: 20, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !9, line: 78, column: 13)
!123 = !DILocation(line: 78, column: 18, scope: !122)
!124 = !DILocation(line: 78, column: 25, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !9, line: 78, column: 13)
!126 = !DILocation(line: 78, column: 27, scope: !125)
!127 = !DILocation(line: 78, column: 13, scope: !122)
!128 = !DILocation(line: 80, column: 34, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !9, line: 79, column: 13)
!130 = !DILocation(line: 80, column: 27, scope: !129)
!131 = !DILocation(line: 80, column: 17, scope: !129)
!132 = !DILocation(line: 80, column: 22, scope: !129)
!133 = !DILocation(line: 80, column: 25, scope: !129)
!134 = !DILocation(line: 81, column: 13, scope: !129)
!135 = !DILocation(line: 78, column: 35, scope: !125)
!136 = !DILocation(line: 78, column: 13, scope: !125)
!137 = distinct !{!137, !127, !138, !71}
!138 = !DILocation(line: 81, column: 13, scope: !122)
!139 = !DILocation(line: 82, column: 26, scope: !119)
!140 = !DILocation(line: 82, column: 13, scope: !119)
!141 = !DILocation(line: 85, column: 1, scope: !99)
!142 = distinct !DISubprogram(name: "goodG2B2", scope: !9, file: !9, line: 88, type: !19, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!143 = !DILocalVariable(name: "data", scope: !142, file: !9, line: 90, type: !23)
!144 = !DILocation(line: 90, column: 11, scope: !142)
!145 = !DILocalVariable(name: "dataBadBuffer", scope: !142, file: !9, line: 91, type: !26)
!146 = !DILocation(line: 91, column: 9, scope: !142)
!147 = !DILocalVariable(name: "dataGoodBuffer", scope: !142, file: !9, line: 92, type: !31)
!148 = !DILocation(line: 92, column: 9, scope: !142)
!149 = !DILocation(line: 93, column: 8, scope: !150)
!150 = distinct !DILexicalBlock(scope: !142, file: !9, line: 93, column: 8)
!151 = !DILocation(line: 93, column: 8, scope: !142)
!152 = !DILocation(line: 96, column: 16, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !9, line: 94, column: 5)
!154 = !DILocation(line: 96, column: 14, scope: !153)
!155 = !DILocation(line: 97, column: 5, scope: !153)
!156 = !DILocalVariable(name: "source", scope: !157, file: !9, line: 99, type: !31)
!157 = distinct !DILexicalBlock(scope: !142, file: !9, line: 98, column: 5)
!158 = !DILocation(line: 99, column: 13, scope: !157)
!159 = !DILocalVariable(name: "i", scope: !160, file: !9, line: 101, type: !47)
!160 = distinct !DILexicalBlock(scope: !157, file: !9, line: 100, column: 9)
!161 = !DILocation(line: 101, column: 20, scope: !160)
!162 = !DILocation(line: 103, column: 20, scope: !163)
!163 = distinct !DILexicalBlock(scope: !160, file: !9, line: 103, column: 13)
!164 = !DILocation(line: 103, column: 18, scope: !163)
!165 = !DILocation(line: 103, column: 25, scope: !166)
!166 = distinct !DILexicalBlock(scope: !163, file: !9, line: 103, column: 13)
!167 = !DILocation(line: 103, column: 27, scope: !166)
!168 = !DILocation(line: 103, column: 13, scope: !163)
!169 = !DILocation(line: 105, column: 34, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !9, line: 104, column: 13)
!171 = !DILocation(line: 105, column: 27, scope: !170)
!172 = !DILocation(line: 105, column: 17, scope: !170)
!173 = !DILocation(line: 105, column: 22, scope: !170)
!174 = !DILocation(line: 105, column: 25, scope: !170)
!175 = !DILocation(line: 106, column: 13, scope: !170)
!176 = !DILocation(line: 103, column: 35, scope: !166)
!177 = !DILocation(line: 103, column: 13, scope: !166)
!178 = distinct !{!178, !168, !179, !71}
!179 = !DILocation(line: 106, column: 13, scope: !163)
!180 = !DILocation(line: 107, column: 26, scope: !160)
!181 = !DILocation(line: 107, column: 13, scope: !160)
!182 = !DILocation(line: 110, column: 1, scope: !142)
