; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_03-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_03-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_03_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !20, metadata !DIExpression()), !dbg !24
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !25
  store i8* %arraydecay, i8** %data, align 8, !dbg !26
  %0 = load i8*, i8** %data, align 8, !dbg !27
  %1 = load i8*, i8** %data, align 8, !dbg !27
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !27
  %call = call i8* @__memset_chk(i8* noundef %0, i32 noundef 65, i64 noundef 99, i64 noundef %2) #5, !dbg !27
  %3 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !32, metadata !DIExpression()), !dbg !37
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !45, metadata !DIExpression()), !dbg !46
  %5 = load i8*, i8** %data, align 8, !dbg !47
  %call1 = call i64 @strlen(i8* noundef %5), !dbg !48
  store i64 %call1, i64* %dataLen, align 8, !dbg !49
  store i64 0, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !53
  %7 = load i64, i64* %dataLen, align 8, !dbg !55
  %cmp = icmp ult i64 %6, %7, !dbg !56
  br i1 %cmp, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !58
  %9 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx2 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !58
  %10 = load i8, i8* %arrayidx2, align 1, !dbg !58
  %11 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !62
  store i8 %10, i8* %arrayidx3, align 1, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %12, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !70
  store i8 0, i8* %arrayidx4, align 1, !dbg !71
  %13 = load i8*, i8** %data, align 8, !dbg !72
  call void @printLine(i8* noundef %13), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i64 @strlen(i8* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_03_good() #0 !dbg !75 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* noundef null), !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 noundef %conv), !dbg !90
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_03_good(), !dbg !92
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_03_bad(), !dbg !95
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !98 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !103
  store i8* %arraydecay, i8** %data, align 8, !dbg !104
  %0 = load i8*, i8** %data, align 8, !dbg !105
  %1 = load i8*, i8** %data, align 8, !dbg !105
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !105
  %call = call i8* @__memset_chk(i8* noundef %0, i32 noundef 65, i64 noundef 49, i64 noundef %2) #5, !dbg !105
  %3 = load i8*, i8** %data, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !108
  store i8 0, i8* %arrayidx, align 1, !dbg !109
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !110, metadata !DIExpression()), !dbg !112
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !112
  call void @llvm.dbg.declare(metadata i64* %i, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !115, metadata !DIExpression()), !dbg !116
  %5 = load i8*, i8** %data, align 8, !dbg !117
  %call1 = call i64 @strlen(i8* noundef %5), !dbg !118
  store i64 %call1, i64* %dataLen, align 8, !dbg !119
  store i64 0, i64* %i, align 8, !dbg !120
  br label %for.cond, !dbg !122

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !123
  %7 = load i64, i64* %dataLen, align 8, !dbg !125
  %cmp = icmp ult i64 %6, %7, !dbg !126
  br i1 %cmp, label %for.body, label %for.end, !dbg !127

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !128
  %9 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx2 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !128
  %10 = load i8, i8* %arrayidx2, align 1, !dbg !128
  %11 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !132
  store i8 %10, i8* %arrayidx3, align 1, !dbg !133
  br label %for.inc, !dbg !134

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !135
  %inc = add i64 %12, 1, !dbg !135
  store i64 %inc, i64* %i, align 8, !dbg !135
  br label %for.cond, !dbg !136, !llvm.loop !137

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !139
  store i8 0, i8* %arrayidx4, align 1, !dbg !140
  %13 = load i8*, i8** %data, align 8, !dbg !141
  call void @printLine(i8* noundef %13), !dbg !142
  ret void, !dbg !143
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !144 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !145, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !147, metadata !DIExpression()), !dbg !148
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !149
  store i8* %arraydecay, i8** %data, align 8, !dbg !150
  %0 = load i8*, i8** %data, align 8, !dbg !151
  %1 = load i8*, i8** %data, align 8, !dbg !151
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !151
  %call = call i8* @__memset_chk(i8* noundef %0, i32 noundef 65, i64 noundef 49, i64 noundef %2) #5, !dbg !151
  %3 = load i8*, i8** %data, align 8, !dbg !154
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !154
  store i8 0, i8* %arrayidx, align 1, !dbg !155
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !156, metadata !DIExpression()), !dbg !158
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !158
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !158
  call void @llvm.dbg.declare(metadata i64* %i, metadata !159, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !161, metadata !DIExpression()), !dbg !162
  %5 = load i8*, i8** %data, align 8, !dbg !163
  %call1 = call i64 @strlen(i8* noundef %5), !dbg !164
  store i64 %call1, i64* %dataLen, align 8, !dbg !165
  store i64 0, i64* %i, align 8, !dbg !166
  br label %for.cond, !dbg !168

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !169
  %7 = load i64, i64* %dataLen, align 8, !dbg !171
  %cmp = icmp ult i64 %6, %7, !dbg !172
  br i1 %cmp, label %for.body, label %for.end, !dbg !173

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !174
  %9 = load i64, i64* %i, align 8, !dbg !176
  %arrayidx2 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !174
  %10 = load i8, i8* %arrayidx2, align 1, !dbg !174
  %11 = load i64, i64* %i, align 8, !dbg !177
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !178
  store i8 %10, i8* %arrayidx3, align 1, !dbg !179
  br label %for.inc, !dbg !180

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !181
  %inc = add i64 %12, 1, !dbg !181
  store i64 %inc, i64* %i, align 8, !dbg !181
  br label %for.cond, !dbg !182, !llvm.loop !183

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !185
  store i8 0, i8* %arrayidx4, align 1, !dbg !186
  %13 = load i8*, i8** %data, align 8, !dbg !187
  call void @printLine(i8* noundef %13), !dbg !188
  ret void, !dbg !189
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_03_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 25, column: 12, scope: !11)
!20 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 800, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 100)
!24 = !DILocation(line: 26, column: 10, scope: !11)
!25 = !DILocation(line: 27, column: 12, scope: !11)
!26 = !DILocation(line: 27, column: 10, scope: !11)
!27 = !DILocation(line: 31, column: 9, scope: !28)
!28 = distinct !DILexicalBlock(scope: !29, file: !12, line: 29, column: 5)
!29 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!30 = !DILocation(line: 32, column: 9, scope: !28)
!31 = !DILocation(line: 32, column: 21, scope: !28)
!32 = !DILocalVariable(name: "dest", scope: !33, file: !12, line: 35, type: !34)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 400, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 50)
!37 = !DILocation(line: 35, column: 14, scope: !33)
!38 = !DILocalVariable(name: "i", scope: !33, file: !12, line: 36, type: !39)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 31, baseType: !41)
!40 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !42, line: 94, baseType: !43)
!42 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!43 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 36, column: 16, scope: !33)
!45 = !DILocalVariable(name: "dataLen", scope: !33, file: !12, line: 36, type: !39)
!46 = !DILocation(line: 36, column: 19, scope: !33)
!47 = !DILocation(line: 37, column: 26, scope: !33)
!48 = !DILocation(line: 37, column: 19, scope: !33)
!49 = !DILocation(line: 37, column: 17, scope: !33)
!50 = !DILocation(line: 39, column: 16, scope: !51)
!51 = distinct !DILexicalBlock(scope: !33, file: !12, line: 39, column: 9)
!52 = !DILocation(line: 39, column: 14, scope: !51)
!53 = !DILocation(line: 39, column: 21, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !12, line: 39, column: 9)
!55 = !DILocation(line: 39, column: 25, scope: !54)
!56 = !DILocation(line: 39, column: 23, scope: !54)
!57 = !DILocation(line: 39, column: 9, scope: !51)
!58 = !DILocation(line: 41, column: 23, scope: !59)
!59 = distinct !DILexicalBlock(scope: !54, file: !12, line: 40, column: 9)
!60 = !DILocation(line: 41, column: 28, scope: !59)
!61 = !DILocation(line: 41, column: 18, scope: !59)
!62 = !DILocation(line: 41, column: 13, scope: !59)
!63 = !DILocation(line: 41, column: 21, scope: !59)
!64 = !DILocation(line: 42, column: 9, scope: !59)
!65 = !DILocation(line: 39, column: 35, scope: !54)
!66 = !DILocation(line: 39, column: 9, scope: !54)
!67 = distinct !{!67, !57, !68, !69}
!68 = !DILocation(line: 42, column: 9, scope: !51)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 43, column: 9, scope: !33)
!71 = !DILocation(line: 43, column: 20, scope: !33)
!72 = !DILocation(line: 44, column: 19, scope: !33)
!73 = !DILocation(line: 44, column: 9, scope: !33)
!74 = !DILocation(line: 46, column: 1, scope: !11)
!75 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_03_good", scope: !12, file: !12, line: 109, type: !13, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!76 = !DILocation(line: 111, column: 5, scope: !75)
!77 = !DILocation(line: 112, column: 5, scope: !75)
!78 = !DILocation(line: 113, column: 1, scope: !75)
!79 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 125, type: !80, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!80 = !DISubroutineType(types: !81)
!81 = !{!82, !82, !83}
!82 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !12, line: 125, type: !82)
!85 = !DILocation(line: 125, column: 14, scope: !79)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !12, line: 125, type: !83)
!87 = !DILocation(line: 125, column: 27, scope: !79)
!88 = !DILocation(line: 128, column: 22, scope: !79)
!89 = !DILocation(line: 128, column: 12, scope: !79)
!90 = !DILocation(line: 128, column: 5, scope: !79)
!91 = !DILocation(line: 130, column: 5, scope: !79)
!92 = !DILocation(line: 131, column: 5, scope: !79)
!93 = !DILocation(line: 132, column: 5, scope: !79)
!94 = !DILocation(line: 135, column: 5, scope: !79)
!95 = !DILocation(line: 136, column: 5, scope: !79)
!96 = !DILocation(line: 137, column: 5, scope: !79)
!97 = !DILocation(line: 139, column: 5, scope: !79)
!98 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 53, type: !13, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!99 = !DILocalVariable(name: "data", scope: !98, file: !12, line: 55, type: !17)
!100 = !DILocation(line: 55, column: 12, scope: !98)
!101 = !DILocalVariable(name: "dataBuffer", scope: !98, file: !12, line: 56, type: !21)
!102 = !DILocation(line: 56, column: 10, scope: !98)
!103 = !DILocation(line: 57, column: 12, scope: !98)
!104 = !DILocation(line: 57, column: 10, scope: !98)
!105 = !DILocation(line: 66, column: 9, scope: !106)
!106 = distinct !DILexicalBlock(scope: !107, file: !12, line: 64, column: 5)
!107 = distinct !DILexicalBlock(scope: !98, file: !12, line: 58, column: 8)
!108 = !DILocation(line: 67, column: 9, scope: !106)
!109 = !DILocation(line: 67, column: 20, scope: !106)
!110 = !DILocalVariable(name: "dest", scope: !111, file: !12, line: 70, type: !34)
!111 = distinct !DILexicalBlock(scope: !98, file: !12, line: 69, column: 5)
!112 = !DILocation(line: 70, column: 14, scope: !111)
!113 = !DILocalVariable(name: "i", scope: !111, file: !12, line: 71, type: !39)
!114 = !DILocation(line: 71, column: 16, scope: !111)
!115 = !DILocalVariable(name: "dataLen", scope: !111, file: !12, line: 71, type: !39)
!116 = !DILocation(line: 71, column: 19, scope: !111)
!117 = !DILocation(line: 72, column: 26, scope: !111)
!118 = !DILocation(line: 72, column: 19, scope: !111)
!119 = !DILocation(line: 72, column: 17, scope: !111)
!120 = !DILocation(line: 74, column: 16, scope: !121)
!121 = distinct !DILexicalBlock(scope: !111, file: !12, line: 74, column: 9)
!122 = !DILocation(line: 74, column: 14, scope: !121)
!123 = !DILocation(line: 74, column: 21, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !12, line: 74, column: 9)
!125 = !DILocation(line: 74, column: 25, scope: !124)
!126 = !DILocation(line: 74, column: 23, scope: !124)
!127 = !DILocation(line: 74, column: 9, scope: !121)
!128 = !DILocation(line: 76, column: 23, scope: !129)
!129 = distinct !DILexicalBlock(scope: !124, file: !12, line: 75, column: 9)
!130 = !DILocation(line: 76, column: 28, scope: !129)
!131 = !DILocation(line: 76, column: 18, scope: !129)
!132 = !DILocation(line: 76, column: 13, scope: !129)
!133 = !DILocation(line: 76, column: 21, scope: !129)
!134 = !DILocation(line: 77, column: 9, scope: !129)
!135 = !DILocation(line: 74, column: 35, scope: !124)
!136 = !DILocation(line: 74, column: 9, scope: !124)
!137 = distinct !{!137, !127, !138, !69}
!138 = !DILocation(line: 77, column: 9, scope: !121)
!139 = !DILocation(line: 78, column: 9, scope: !111)
!140 = !DILocation(line: 78, column: 20, scope: !111)
!141 = !DILocation(line: 79, column: 19, scope: !111)
!142 = !DILocation(line: 79, column: 9, scope: !111)
!143 = !DILocation(line: 81, column: 1, scope: !98)
!144 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 84, type: !13, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!145 = !DILocalVariable(name: "data", scope: !144, file: !12, line: 86, type: !17)
!146 = !DILocation(line: 86, column: 12, scope: !144)
!147 = !DILocalVariable(name: "dataBuffer", scope: !144, file: !12, line: 87, type: !21)
!148 = !DILocation(line: 87, column: 10, scope: !144)
!149 = !DILocation(line: 88, column: 12, scope: !144)
!150 = !DILocation(line: 88, column: 10, scope: !144)
!151 = !DILocation(line: 92, column: 9, scope: !152)
!152 = distinct !DILexicalBlock(scope: !153, file: !12, line: 90, column: 5)
!153 = distinct !DILexicalBlock(scope: !144, file: !12, line: 89, column: 8)
!154 = !DILocation(line: 93, column: 9, scope: !152)
!155 = !DILocation(line: 93, column: 20, scope: !152)
!156 = !DILocalVariable(name: "dest", scope: !157, file: !12, line: 96, type: !34)
!157 = distinct !DILexicalBlock(scope: !144, file: !12, line: 95, column: 5)
!158 = !DILocation(line: 96, column: 14, scope: !157)
!159 = !DILocalVariable(name: "i", scope: !157, file: !12, line: 97, type: !39)
!160 = !DILocation(line: 97, column: 16, scope: !157)
!161 = !DILocalVariable(name: "dataLen", scope: !157, file: !12, line: 97, type: !39)
!162 = !DILocation(line: 97, column: 19, scope: !157)
!163 = !DILocation(line: 98, column: 26, scope: !157)
!164 = !DILocation(line: 98, column: 19, scope: !157)
!165 = !DILocation(line: 98, column: 17, scope: !157)
!166 = !DILocation(line: 100, column: 16, scope: !167)
!167 = distinct !DILexicalBlock(scope: !157, file: !12, line: 100, column: 9)
!168 = !DILocation(line: 100, column: 14, scope: !167)
!169 = !DILocation(line: 100, column: 21, scope: !170)
!170 = distinct !DILexicalBlock(scope: !167, file: !12, line: 100, column: 9)
!171 = !DILocation(line: 100, column: 25, scope: !170)
!172 = !DILocation(line: 100, column: 23, scope: !170)
!173 = !DILocation(line: 100, column: 9, scope: !167)
!174 = !DILocation(line: 102, column: 23, scope: !175)
!175 = distinct !DILexicalBlock(scope: !170, file: !12, line: 101, column: 9)
!176 = !DILocation(line: 102, column: 28, scope: !175)
!177 = !DILocation(line: 102, column: 18, scope: !175)
!178 = !DILocation(line: 102, column: 13, scope: !175)
!179 = !DILocation(line: 102, column: 21, scope: !175)
!180 = !DILocation(line: 103, column: 9, scope: !175)
!181 = !DILocation(line: 100, column: 35, scope: !170)
!182 = !DILocation(line: 100, column: 9, scope: !170)
!183 = distinct !{!183, !173, !184, !69}
!184 = !DILocation(line: 103, column: 9, scope: !167)
!185 = !DILocation(line: 104, column: 9, scope: !157)
!186 = !DILocation(line: 104, column: 20, scope: !157)
!187 = !DILocation(line: 105, column: 19, scope: !157)
!188 = !DILocation(line: 105, column: 9, scope: !157)
!189 = !DILocation(line: 107, column: 1, scope: !144)
