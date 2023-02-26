; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_05-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_05-1.c"
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !33, metadata !DIExpression()), !dbg !37
  %0 = load i32, i32* @staticTrue, align 4, !dbg !38
  %tobool = icmp ne i32 %0, 0, !dbg !38
  br i1 %tobool, label %if.then, label %if.end, !dbg !40

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !41
  store i64* %arraydecay, i64** %data, align 8, !dbg !43
  br label %if.end, !dbg !44

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !45, metadata !DIExpression()), !dbg !47
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %i, metadata !48, metadata !DIExpression()), !dbg !55
  store i64 0, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !59
  %cmp = icmp ult i64 %2, 100, !dbg !61
  br i1 %cmp, label %for.body, label %for.end, !dbg !62

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !65
  %4 = load i64, i64* %arrayidx, align 8, !dbg !65
  %5 = load i64*, i64** %data, align 8, !dbg !66
  %6 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx1 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !66
  store i64 %4, i64* %arrayidx1, align 8, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !70
  %inc = add i64 %7, 1, !dbg !70
  store i64 %inc, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !75
  %arrayidx2 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !75
  %9 = load i64, i64* %arrayidx2, align 8, !dbg !75
  call void @printLongLongLine(i64 noundef %9), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLongLongLine(i64 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_05_good() #0 !dbg !78 {
entry:
  call void @goodG2B1(), !dbg !79
  call void @goodG2B2(), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !82 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !90, metadata !DIExpression()), !dbg !91
  %call = call i64 @time(i64* noundef null), !dbg !92
  %conv = trunc i64 %call to i32, !dbg !93
  call void @srand(i32 noundef %conv), !dbg !94
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_05_good(), !dbg !96
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !97
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_05_bad(), !dbg !99
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !100
  ret i32 0, !dbg !101
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !102 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %0 = load i32, i32* @staticFalse, align 4, !dbg !109
  %tobool = icmp ne i32 %0, 0, !dbg !109
  br i1 %tobool, label %if.then, label %if.else, !dbg !111

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !112
  br label %if.end, !dbg !114

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !115
  store i64* %arraydecay, i64** %data, align 8, !dbg !117
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !118, metadata !DIExpression()), !dbg !120
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !120
  call void @llvm.dbg.declare(metadata i64* %i, metadata !121, metadata !DIExpression()), !dbg !123
  store i64 0, i64* %i, align 8, !dbg !124
  br label %for.cond, !dbg !126

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !127
  %cmp = icmp ult i64 %2, 100, !dbg !129
  br i1 %cmp, label %for.body, label %for.end, !dbg !130

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !133
  %4 = load i64, i64* %arrayidx, align 8, !dbg !133
  %5 = load i64*, i64** %data, align 8, !dbg !134
  %6 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx1 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !134
  store i64 %4, i64* %arrayidx1, align 8, !dbg !136
  br label %for.inc, !dbg !137

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !138
  %inc = add i64 %7, 1, !dbg !138
  store i64 %inc, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !139, !llvm.loop !140

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !142
  %arrayidx2 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !142
  %9 = load i64, i64* %arrayidx2, align 8, !dbg !142
  call void @printLongLongLine(i64 noundef %9), !dbg !143
  ret void, !dbg !144
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !145 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !146, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !148, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !150, metadata !DIExpression()), !dbg !151
  %0 = load i32, i32* @staticTrue, align 4, !dbg !152
  %tobool = icmp ne i32 %0, 0, !dbg !152
  br i1 %tobool, label %if.then, label %if.end, !dbg !154

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !155
  store i64* %arraydecay, i64** %data, align 8, !dbg !157
  br label %if.end, !dbg !158

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !159, metadata !DIExpression()), !dbg !161
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !161
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !161
  call void @llvm.dbg.declare(metadata i64* %i, metadata !162, metadata !DIExpression()), !dbg !164
  store i64 0, i64* %i, align 8, !dbg !165
  br label %for.cond, !dbg !167

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !168
  %cmp = icmp ult i64 %2, 100, !dbg !170
  br i1 %cmp, label %for.body, label %for.end, !dbg !171

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !172
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !174
  %4 = load i64, i64* %arrayidx, align 8, !dbg !174
  %5 = load i64*, i64** %data, align 8, !dbg !175
  %6 = load i64, i64* %i, align 8, !dbg !176
  %arrayidx1 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !175
  store i64 %4, i64* %arrayidx1, align 8, !dbg !177
  br label %for.inc, !dbg !178

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !179
  %inc = add i64 %7, 1, !dbg !179
  store i64 %inc, i64* %i, align 8, !dbg !179
  br label %for.cond, !dbg !180, !llvm.loop !181

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !183
  %arrayidx2 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !183
  %9 = load i64, i64* %arrayidx2, align 8, !dbg !183
  call void @printLongLongLine(i64 noundef %9), !dbg !184
  ret void, !dbg !185
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
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0, !7}
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !9, line: 24, type: !10, isLocal: true, isDefinition: true)
!9 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Homebrew clang version 14.0.6"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_05_bad", scope: !9, file: !9, line: 28, type: !19, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !9, line: 30, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !25, line: 30, baseType: !26)
!25 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_int64_t.h", directory: "")
!26 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!27 = !DILocation(line: 30, column: 15, scope: !18)
!28 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !9, line: 31, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 3200, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 50)
!32 = !DILocation(line: 31, column: 13, scope: !18)
!33 = !DILocalVariable(name: "dataGoodBuffer", scope: !18, file: !9, line: 32, type: !34)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 6400, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 32, column: 13, scope: !18)
!38 = !DILocation(line: 33, column: 8, scope: !39)
!39 = distinct !DILexicalBlock(scope: !18, file: !9, line: 33, column: 8)
!40 = !DILocation(line: 33, column: 8, scope: !18)
!41 = !DILocation(line: 37, column: 16, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !9, line: 34, column: 5)
!43 = !DILocation(line: 37, column: 14, scope: !42)
!44 = !DILocation(line: 38, column: 5, scope: !42)
!45 = !DILocalVariable(name: "source", scope: !46, file: !9, line: 40, type: !34)
!46 = distinct !DILexicalBlock(scope: !18, file: !9, line: 39, column: 5)
!47 = !DILocation(line: 40, column: 17, scope: !46)
!48 = !DILocalVariable(name: "i", scope: !49, file: !9, line: 42, type: !50)
!49 = distinct !DILexicalBlock(scope: !46, file: !9, line: 41, column: 9)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !51, line: 31, baseType: !52)
!51 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !53, line: 94, baseType: !54)
!53 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!54 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!55 = !DILocation(line: 42, column: 20, scope: !49)
!56 = !DILocation(line: 44, column: 20, scope: !57)
!57 = distinct !DILexicalBlock(scope: !49, file: !9, line: 44, column: 13)
!58 = !DILocation(line: 44, column: 18, scope: !57)
!59 = !DILocation(line: 44, column: 25, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !9, line: 44, column: 13)
!61 = !DILocation(line: 44, column: 27, scope: !60)
!62 = !DILocation(line: 44, column: 13, scope: !57)
!63 = !DILocation(line: 46, column: 34, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !9, line: 45, column: 13)
!65 = !DILocation(line: 46, column: 27, scope: !64)
!66 = !DILocation(line: 46, column: 17, scope: !64)
!67 = !DILocation(line: 46, column: 22, scope: !64)
!68 = !DILocation(line: 46, column: 25, scope: !64)
!69 = !DILocation(line: 47, column: 13, scope: !64)
!70 = !DILocation(line: 44, column: 35, scope: !60)
!71 = !DILocation(line: 44, column: 13, scope: !60)
!72 = distinct !{!72, !62, !73, !74}
!73 = !DILocation(line: 47, column: 13, scope: !57)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocation(line: 48, column: 31, scope: !49)
!76 = !DILocation(line: 48, column: 13, scope: !49)
!77 = !DILocation(line: 51, column: 1, scope: !18)
!78 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_05_good", scope: !9, file: !9, line: 112, type: !19, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!79 = !DILocation(line: 114, column: 5, scope: !78)
!80 = !DILocation(line: 115, column: 5, scope: !78)
!81 = !DILocation(line: 116, column: 1, scope: !78)
!82 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 128, type: !83, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!83 = !DISubroutineType(types: !84)
!84 = !{!10, !10, !85}
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!88 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !9, line: 128, type: !10)
!89 = !DILocation(line: 128, column: 14, scope: !82)
!90 = !DILocalVariable(name: "argv", arg: 2, scope: !82, file: !9, line: 128, type: !85)
!91 = !DILocation(line: 128, column: 27, scope: !82)
!92 = !DILocation(line: 131, column: 22, scope: !82)
!93 = !DILocation(line: 131, column: 12, scope: !82)
!94 = !DILocation(line: 131, column: 5, scope: !82)
!95 = !DILocation(line: 133, column: 5, scope: !82)
!96 = !DILocation(line: 134, column: 5, scope: !82)
!97 = !DILocation(line: 135, column: 5, scope: !82)
!98 = !DILocation(line: 138, column: 5, scope: !82)
!99 = !DILocation(line: 139, column: 5, scope: !82)
!100 = !DILocation(line: 140, column: 5, scope: !82)
!101 = !DILocation(line: 142, column: 5, scope: !82)
!102 = distinct !DISubprogram(name: "goodG2B1", scope: !9, file: !9, line: 58, type: !19, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!103 = !DILocalVariable(name: "data", scope: !102, file: !9, line: 60, type: !23)
!104 = !DILocation(line: 60, column: 15, scope: !102)
!105 = !DILocalVariable(name: "dataBadBuffer", scope: !102, file: !9, line: 61, type: !29)
!106 = !DILocation(line: 61, column: 13, scope: !102)
!107 = !DILocalVariable(name: "dataGoodBuffer", scope: !102, file: !9, line: 62, type: !34)
!108 = !DILocation(line: 62, column: 13, scope: !102)
!109 = !DILocation(line: 63, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !102, file: !9, line: 63, column: 8)
!111 = !DILocation(line: 63, column: 8, scope: !102)
!112 = !DILocation(line: 66, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !9, line: 64, column: 5)
!114 = !DILocation(line: 67, column: 5, scope: !113)
!115 = !DILocation(line: 71, column: 16, scope: !116)
!116 = distinct !DILexicalBlock(scope: !110, file: !9, line: 69, column: 5)
!117 = !DILocation(line: 71, column: 14, scope: !116)
!118 = !DILocalVariable(name: "source", scope: !119, file: !9, line: 74, type: !34)
!119 = distinct !DILexicalBlock(scope: !102, file: !9, line: 73, column: 5)
!120 = !DILocation(line: 74, column: 17, scope: !119)
!121 = !DILocalVariable(name: "i", scope: !122, file: !9, line: 76, type: !50)
!122 = distinct !DILexicalBlock(scope: !119, file: !9, line: 75, column: 9)
!123 = !DILocation(line: 76, column: 20, scope: !122)
!124 = !DILocation(line: 78, column: 20, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !9, line: 78, column: 13)
!126 = !DILocation(line: 78, column: 18, scope: !125)
!127 = !DILocation(line: 78, column: 25, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !9, line: 78, column: 13)
!129 = !DILocation(line: 78, column: 27, scope: !128)
!130 = !DILocation(line: 78, column: 13, scope: !125)
!131 = !DILocation(line: 80, column: 34, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !9, line: 79, column: 13)
!133 = !DILocation(line: 80, column: 27, scope: !132)
!134 = !DILocation(line: 80, column: 17, scope: !132)
!135 = !DILocation(line: 80, column: 22, scope: !132)
!136 = !DILocation(line: 80, column: 25, scope: !132)
!137 = !DILocation(line: 81, column: 13, scope: !132)
!138 = !DILocation(line: 78, column: 35, scope: !128)
!139 = !DILocation(line: 78, column: 13, scope: !128)
!140 = distinct !{!140, !130, !141, !74}
!141 = !DILocation(line: 81, column: 13, scope: !125)
!142 = !DILocation(line: 82, column: 31, scope: !122)
!143 = !DILocation(line: 82, column: 13, scope: !122)
!144 = !DILocation(line: 85, column: 1, scope: !102)
!145 = distinct !DISubprogram(name: "goodG2B2", scope: !9, file: !9, line: 88, type: !19, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!146 = !DILocalVariable(name: "data", scope: !145, file: !9, line: 90, type: !23)
!147 = !DILocation(line: 90, column: 15, scope: !145)
!148 = !DILocalVariable(name: "dataBadBuffer", scope: !145, file: !9, line: 91, type: !29)
!149 = !DILocation(line: 91, column: 13, scope: !145)
!150 = !DILocalVariable(name: "dataGoodBuffer", scope: !145, file: !9, line: 92, type: !34)
!151 = !DILocation(line: 92, column: 13, scope: !145)
!152 = !DILocation(line: 93, column: 8, scope: !153)
!153 = distinct !DILexicalBlock(scope: !145, file: !9, line: 93, column: 8)
!154 = !DILocation(line: 93, column: 8, scope: !145)
!155 = !DILocation(line: 96, column: 16, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !9, line: 94, column: 5)
!157 = !DILocation(line: 96, column: 14, scope: !156)
!158 = !DILocation(line: 97, column: 5, scope: !156)
!159 = !DILocalVariable(name: "source", scope: !160, file: !9, line: 99, type: !34)
!160 = distinct !DILexicalBlock(scope: !145, file: !9, line: 98, column: 5)
!161 = !DILocation(line: 99, column: 17, scope: !160)
!162 = !DILocalVariable(name: "i", scope: !163, file: !9, line: 101, type: !50)
!163 = distinct !DILexicalBlock(scope: !160, file: !9, line: 100, column: 9)
!164 = !DILocation(line: 101, column: 20, scope: !163)
!165 = !DILocation(line: 103, column: 20, scope: !166)
!166 = distinct !DILexicalBlock(scope: !163, file: !9, line: 103, column: 13)
!167 = !DILocation(line: 103, column: 18, scope: !166)
!168 = !DILocation(line: 103, column: 25, scope: !169)
!169 = distinct !DILexicalBlock(scope: !166, file: !9, line: 103, column: 13)
!170 = !DILocation(line: 103, column: 27, scope: !169)
!171 = !DILocation(line: 103, column: 13, scope: !166)
!172 = !DILocation(line: 105, column: 34, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !9, line: 104, column: 13)
!174 = !DILocation(line: 105, column: 27, scope: !173)
!175 = !DILocation(line: 105, column: 17, scope: !173)
!176 = !DILocation(line: 105, column: 22, scope: !173)
!177 = !DILocation(line: 105, column: 25, scope: !173)
!178 = !DILocation(line: 106, column: 13, scope: !173)
!179 = !DILocation(line: 103, column: 35, scope: !169)
!180 = !DILocation(line: 103, column: 13, scope: !169)
!181 = distinct !{!181, !171, !182, !74}
!182 = !DILocation(line: 106, column: 13, scope: !166)
!183 = !DILocation(line: 107, column: 31, scope: !163)
!184 = !DILocation(line: 107, column: 13, scope: !163)
!185 = !DILocation(line: 110, column: 1, scope: !145)
