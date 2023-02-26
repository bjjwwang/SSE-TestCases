; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Memset_Overflow_01-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Memset_Overflow_01-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %buffer1 = alloca [4 x i8], align 1
  %buffer2 = alloca [3 x i8], align 1
  %a = alloca i32, align 4
  %data = alloca i32, align 4
  %len = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [4 x i8]* %buffer1, metadata !14, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [3 x i8]* %buffer2, metadata !20, metadata !DIExpression()), !dbg !24
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !25
  call void @srand(i32 %call) #6, !dbg !26
  call void @llvm.dbg.declare(metadata i32* %a, metadata !27, metadata !DIExpression()), !dbg !28
  %call1 = call i32 @rand() #6, !dbg !29
  %rem = srem i32 %call1, 5, !dbg !30
  store i32 %rem, i32* %a, align 4, !dbg !28
  call void @llvm.dbg.declare(metadata i32* %data, metadata !31, metadata !DIExpression()), !dbg !32
  store i32 0, i32* %data, align 4, !dbg !32
  br label %while.cond, !dbg !33

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* %data, align 4, !dbg !34
  %1 = load i32, i32* %a, align 4, !dbg !35
  %cmp = icmp slt i32 %0, %1, !dbg !36
  br i1 %cmp, label %while.body, label %while.end, !dbg !33

while.body:                                       ; preds = %while.cond
  %2 = load i32, i32* %data, align 4, !dbg !37
  %inc = add nsw i32 %2, 1, !dbg !37
  store i32 %inc, i32* %data, align 4, !dbg !37
  br label %while.cond, !dbg !33, !llvm.loop !39

while.end:                                        ; preds = %while.cond
  %arraydecay = getelementptr inbounds [4 x i8], [4 x i8]* %buffer1, i64 0, i64 0, !dbg !42
  %3 = load i32, i32* %data, align 4, !dbg !43
  %conv = sext i32 %3 to i64, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 1 %arraydecay, i8 97, i64 %conv, i1 false), !dbg !42
  %arraydecay2 = getelementptr inbounds [3 x i8], [3 x i8]* %buffer2, i64 0, i64 0, !dbg !44
  %4 = load i32, i32* %data, align 4, !dbg !45
  %conv3 = sext i32 %4 to i64, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 1 %arraydecay2, i8 97, i64 %conv3, i1 false), !dbg !44
  call void @llvm.dbg.declare(metadata i32* %len, metadata !46, metadata !DIExpression()), !dbg !47
  %arraydecay4 = getelementptr inbounds [4 x i8], [4 x i8]* %buffer1, i64 0, i64 0, !dbg !48
  %call5 = call i64 @strlen(i8* %arraydecay4) #7, !dbg !49
  %conv6 = trunc i64 %call5 to i32, !dbg !49
  store i32 %conv6, i32* %len, align 4, !dbg !47
  %5 = load i32, i32* %retval, align 4, !dbg !50
  ret i32 %5, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

declare dso_local i32 @time(...) #3

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Memset_Overflow_01-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Memset_Overflow_01-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "buffer1", scope: !9, file: !10, line: 8, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 32, elements: !17)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !{!18}
!18 = !DISubrange(count: 4)
!19 = !DILocation(line: 8, column: 7, scope: !9)
!20 = !DILocalVariable(name: "buffer2", scope: !9, file: !10, line: 9, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 24, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 3)
!24 = !DILocation(line: 9, column: 7, scope: !9)
!25 = !DILocation(line: 10, column: 8, scope: !9)
!26 = !DILocation(line: 10, column: 2, scope: !9)
!27 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 11, type: !13)
!28 = !DILocation(line: 11, column: 6, scope: !9)
!29 = !DILocation(line: 11, column: 10, scope: !9)
!30 = !DILocation(line: 11, column: 17, scope: !9)
!31 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 13, type: !13)
!32 = !DILocation(line: 13, column: 9, scope: !9)
!33 = !DILocation(line: 14, column: 5, scope: !9)
!34 = !DILocation(line: 14, column: 12, scope: !9)
!35 = !DILocation(line: 14, column: 19, scope: !9)
!36 = !DILocation(line: 14, column: 17, scope: !9)
!37 = !DILocation(line: 15, column: 13, scope: !38)
!38 = distinct !DILexicalBlock(scope: !9, file: !10, line: 14, column: 22)
!39 = distinct !{!39, !33, !40, !41}
!40 = !DILocation(line: 16, column: 5, scope: !9)
!41 = !{!"llvm.loop.mustprogress"}
!42 = !DILocation(line: 18, column: 2, scope: !9)
!43 = !DILocation(line: 18, column: 23, scope: !9)
!44 = !DILocation(line: 19, column: 2, scope: !9)
!45 = !DILocation(line: 19, column: 23, scope: !9)
!46 = !DILocalVariable(name: "len", scope: !9, file: !10, line: 20, type: !13)
!47 = !DILocation(line: 20, column: 6, scope: !9)
!48 = !DILocation(line: 20, column: 19, scope: !9)
!49 = !DILocation(line: 20, column: 12, scope: !9)
!50 = !DILocation(line: 21, column: 1, scope: !9)
